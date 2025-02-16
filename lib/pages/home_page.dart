import 'package:flutter/material.dart';
import 'package:flutter_sample_one/pages/signup_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
  String _searchQuery = '';
  int _totalResults = 0;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
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
          'id': job['id'],
          'title': job['title'],
          'company': job['company']['name'],
          'location': job['location'],
          'description': job['description'],
          'application_url': job['application_url'],
          'logo': job['company']['logo'],
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFFFFFFF),
                    child: Icon(Icons.person, size: 30, color: Color(0xFF23486A)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("User Name",
                      style: TextStyle(color: Color(0xFFFFFFFF))),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.login, color: Color(0xFF23486A)),
              title: const Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add, color: Color(0xFF23486A)),
              title: const Text('Sign Up'),
              onTap: () {
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
            ListTile(
              leading: const Icon(Icons.assignment, color: Color(0xFF23486A)),
              title: const Text('Application Process'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ApplicationProcessPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_circle, color: Color(0xFF23486A)),
              title: const Text('Success Page'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessPage(),
                  ),
                );
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
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: fetchJobListings(_currentPage),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final filteredJobs = snapshot.data!.where((job) {
                      final title = job['title'].toString().toLowerCase();
                      final company = job['company'].toString().toLowerCase();
                      return title.contains(_searchQuery) ||
                          company.contains(_searchQuery);
                    }).toList();
                    return Text(
                      "${filteredJobs.length} results found",
                      style: const TextStyle(color: Colors.black54, fontSize: 14),
                    );
                  }
                  return const Text(
                    "Loading results...",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchJobListings(_currentPage),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No job listings found.'));
                } else {
                  final jobListings = snapshot.data!;
                  final filteredJobs = jobListings.where((job) {
                    final title = job['title'].toString().toLowerCase();
                    final company = job['company'].toString().toLowerCase();
                    return title.contains(_searchQuery) ||
                        company.contains(_searchQuery);
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredJobs.length,
                    itemBuilder: (context, index) => JobCard(
                      jobTitle: filteredJobs[index]['title'] ?? 'No Title',
                      company: filteredJobs[index]['company'] ?? 'No Company',
                      location: filteredJobs[index]['location'] ?? 'No Location',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobDetailsPage(
                            jobTitle: filteredJobs[index]['title'] ?? 'No Title',
                            company: filteredJobs[index]['company'] ?? 'No Company',
                            location: filteredJobs[index]['location'] ?? 'No Location',
                            logo: filteredJobs[index]['logo'] ?? "No Logo",
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _currentPage > 1
                      ? () => setState(() => _currentPage--)
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
                  onPressed: () => setState(() => _currentPage++),
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