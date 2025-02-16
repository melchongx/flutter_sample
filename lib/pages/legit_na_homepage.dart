import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sample_one/pages/signup_page.dart';
import '../auth_service.dart';
import 'home_page.dart';
import 'application_process_page.dart';
import 'login_page.dart';
import 'success_page.dart';
import 'settings_page.dart';

class LegitNaHomePage extends StatefulWidget {
  const LegitNaHomePage({super.key});

  @override
  State<LegitNaHomePage> createState() => _LegitNaHomePageState();
}

class _LegitNaHomePageState extends State<LegitNaHomePage> {
  final AuthService _authService = AuthService();
  User? _currentUser;
  String _username = "";

  @override
  void initState() {
    super.initState();
    // Set up authentication state listener
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _currentUser = user;
        _username = user?.displayName ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFFFFFFF),
                        child: Icon(Icons.person, size: 30, color: Color(0xFF23486A)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _currentUser != null
                                  ? "Welcome Back, $_username!"
                                  : "Welcome!",
                              style: const TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (_currentUser == null) ...[
                              const SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                                  );
                                },
                                child: const Text(
                                  "Sign up to apply →",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ],
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
            if (_currentUser == null)
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
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LegitNaHomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.work, color: Color(0xFF23486A)),
              title: const Text('Look for Jobs'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF23486A)),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.asset(
                  'assets/lookjob.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: const Color(0xFFFFF8E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "\"There is always a job for you. There is always Job for All.\"",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF23486A),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 26),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF23486A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text(
                    "Start Searching",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  color: const Color(0xFFFFF8E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "JobAll Reviews",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF23486A),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "JobAll",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF23486A),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 30),
                            Icon(Icons.star, color: Colors.amber, size: 30),
                            Icon(Icons.star, color: Colors.amber, size: 30),
                            Icon(Icons.star, color: Colors.amber, size: 30),
                            Icon(Icons.star_half, color: Colors.amber, size: 30),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "4.7 out of 5 - Based on 10,000+ reviews",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF23486A),
                          ),
                        ),
                        SizedBox(height: 16),
                        ReviewCard(
                            name: "Jimmy Gusmanos",
                            role: "Software Engineer",
                            review: "JobAll changed my life! Within a week, I landed my dream job."
                        ),
                        ReviewCard(
                            name: "Bob Builder",
                            role: "Marketing Specialist",
                            review: "Great platform, but I'd love to see more international jobs!"
                        ),
                        ReviewCard(
                            name: "Ma'am Amuh",
                            role: "Graphic Designer",
                            review: "Finding remote work has never been easier! Highly recommended."
                        ),
                        ReviewCard(
                            name: "John Patrick Gozon",
                            role: "HR Manager",
                            review: "We found some of our best employees through this platform!"
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String role;
  final String review;

  const ReviewCard({
    super.key,
    required this.name,
    required this.role,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF23486A), width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ListTile(
        leading: const Icon(Icons.person, color: Color(0xFF23486A)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(role, style: const TextStyle(fontSize: 14, color: Colors.black54)),
            Text('"$review"', style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}