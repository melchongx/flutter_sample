import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_one/pages/signup_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../auth_service.dart';
import 'job_details_page.dart';
import 'legit_na_homepage.dart';
import 'application_process_page.dart';
import 'login_page.dart';
import 'success_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 1;
  final TextEditingController _searchController = TextEditingController();
  final AuthService _authService = AuthService();
  User? _currentUser;
  String _username = "";
  List<Map<String, dynamic>> _jobListings = [];
  List<Map<String, dynamic>> _filteredJobs = [];
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadJobListings();
    _searchController.addListener(_onSearchChanged);

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _currentUser = user;
        _username = user?.displayName ?? "";
      });
    });
  }

  void _onSearchChanged() {
    _filterJobs(_searchController.text.toLowerCase());
  }

  Future<void> _loadJobListings() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final listings = await fetchJobListings(_currentPage);
      setState(() {
        _jobListings = listings;
        _filteredJobs = listings;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load job listings. Please try again.';
      });
    }
  }

  void _filterJobs(String query) {
    setState(() {
      _filteredJobs = _jobListings.where((job) {
        final title = job['title'].toString().toLowerCase();
        final company = job['company'].toString().toLowerCase();
        return title.contains(query) || company.contains(query);
      }).toList();
    });
  }

  Future<List<Map<String, dynamic>>> fetchJobListings(int page) async {
    final response = await http.get(
      Uri.parse('https://thingproxy.freeboard.io/fetch/https://jobdataapi.com/api/jobs/?country_code=PH&max_age=2'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((job) {
        return {
          'title': job['title'],
          'company': job['company']['name'],
          'location': job['location'],
          'logo': job['company']['logo'] ?? '',
          'description': job['description'] ?? '',
          'requirements': job['requirements'],
          'job_type': job['job_type'],
          'posted_at': job['posted_at'],
          'application_url': job['application_url'] ?? '',
        };
      }).toList();
    } else {
      throw Exception('Failed to load job listings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JobAll"),
        backgroundColor: const Color(0xFF23486A),
        foregroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF5B913B)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 24, // Reduced from 30
                        backgroundColor: Color(0xFFFFFFFF),
                        child: Icon(Icons.person, size: 24, color: Color(0xFF23486A)), // Reduced size
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _currentUser != null
                            ? "Welcome Back, $_username!"
                            : "Welcome!",
                        style: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16, // Reduced from 18
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  if (_currentUser == null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Finding a job?",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 13, // Reduced from 14
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpPage()),
                          ),
                          child: const Text(
                            "Sign up to apply",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 13, // Reduced from 14
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                _currentUser != null ? Icons.logout : Icons.login,
                color: const Color(0xFF23486A),
              ),
              title: Text(_currentUser != null ? 'Sign Out' : 'Log In'),
              onTap: () {
                // Close the drawer first
                Navigator.pop(context);

                if (_currentUser != null) {
                  _authService.signOut();
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
              },
            ),
            if (_currentUser == null) // Add this condition
              ListTile(
                leading: const Icon(Icons.person_add, color: Color(0xFF23486A)),
                title: const Text('Sign Up'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
              ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFF23486A)),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LegitNaHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.work, color: Color(0xFF23486A)),
              title: const Text('Look for Jobs'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF23486A)),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Search for Job Listings",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF23486A),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Color(0xFF23486A)),
                    decoration: InputDecoration(
                      hintText: "Search for all the jobs...",
                      hintStyle: const TextStyle(color: Color(0xFF23486A)),
                      prefixIcon: const Icon(Icons.search, color: Color(0xFF23486A)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF23486A), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF23486A), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF23486A), width: 2),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFFFF8E8),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8E8),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF23486A), width: 2),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.filter_list, color: Color(0xFF23486A)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: _isLoading
                  ? const Text(
                "Loading results...",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              )
                  : Text(
                "${_filteredJobs.length} results found",
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage.isNotEmpty
                ? Center(child: Text(_errorMessage))
                : _filteredJobs.isEmpty
                ? const Center(child: Text('No job listings found.'))
                : ListView.builder(
              itemCount: _filteredJobs.length,
              itemBuilder: (context, index) => JobCard(
                jobTitle: _filteredJobs[index]['title'] ?? 'No Title',
                company: _filteredJobs[index]['company'] ?? 'No Company',
                location: _filteredJobs[index]['location'] ?? 'No Location',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobDetailsPage(
                      jobTitle: _filteredJobs[index]['title'] ?? 'No Title',
                      company: _filteredJobs[index]['company'] ?? 'No Company',
                      location: _filteredJobs[index]['location'] ?? 'No Location',
                      logo: _filteredJobs[index]['logo'] ?? "",
                      description: _filteredJobs[index]['description'] ?? 'No description available',
                      requirements: _filteredJobs[index]['requirements'],
                      jobType: _filteredJobs[index]['job_type'],
                      postedAt: _filteredJobs[index]['posted_at'],
                      applicationUrl: _filteredJobs[index]['application_url'] ?? '',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _currentPage > 1 && !_isLoading
                      ? () {
                    setState(() => _currentPage--);
                    _loadJobListings();
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFF8E8),
                    foregroundColor: const Color(0xFF23486A),
                    side: const BorderSide(color: Color(0xFF23486A), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back, color: Color(0xFF23486A)),
                      SizedBox(width: 5),
                      Text("Previous"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: !_isLoading
                      ? () {
                    setState(() => _currentPage++);
                    _loadJobListings();
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFF8E8),
                    foregroundColor: const Color(0xFF23486A),
                    side: const BorderSide(color: Color(0xFF23486A), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text("Next"),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward, color: Color(0xFF23486A)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String location;
  final VoidCallback onTap;

  const JobCard({
    super.key,
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      child: SizedBox(
        height: 75,
        child: ListTile(
          leading: const Icon(Icons.work, color: Color(0xFF23486A), size: 35),
          title: Text(
            jobTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Row(
            children: [
              const Icon(Icons.location_on, color: Color(0xFF23486A), size: 16),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(fontSize: 14, color: Color(0xFF23486A)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward, color: Color(0xFF23486A)),
          onTap: onTap,
        ),
      ),
    );
  }
}