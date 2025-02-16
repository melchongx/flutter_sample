import 'package:flutter/material.dart';
import 'home_page.dart';
import 'application_process_page.dart';
import 'success_page.dart';
import 'settings_page.dart';

class LegitNaHomePage extends StatelessWidget {
  const LegitNaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // White background
      appBar: AppBar(
        title: const Text("JobAll"),
        backgroundColor: const Color(0xFF23486A), // Navy Blue
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
              decoration: const BoxDecoration(color: Color(0xFF5B913B)), // Green
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFFFFFFF), // White
                    child: Icon(Icons.person, size: 30, color: Color(0xFF23486A)), // Navy Blue
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF), // White
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
              leading: const Icon(Icons.home, color: Color(0xFF23486A)), // Navy Blue
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
              leading: const Icon(Icons.work, color: Color(0xFF23486A)), // Navy Blue
              title: const Text('Look for Jobs'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 📌 Load full image inside a scrollable view
              Image.asset(
                'assets/lookjob.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),

              // ✨ Inspirational Quote
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: const Color(0xFFFFF8E8), // Cream background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "\"There is always a job for you. There is always Job for All.\"",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF23486A), // Navy Blue text
                      ),
                    ),
                  ),
                ),
              ),

              // ✅ Start Searching Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 26),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF23486A), // Green
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
                    style: TextStyle(fontSize: 58),
                  ),
                ),
              ),

              // ⭐ Fake Review Section with Centered "JobAll" Text and Testimonials
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  color: const Color(0xFFFFF8E8), // Cream background
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
                            color: Color(0xFF23486A), // Navy Blue text
                          ),
                        ),
                        SizedBox(height: 10),

                        // 🔵 Centered "JobAll"
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "JobAll",
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF23486A), // Navy Blue text
                                ),
                              ),
                            ],
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
                            color: Color(0xFF23486A), // Navy Blue text
                          ),
                        ),

                        SizedBox(height: 16),

                        // ⭐ Reviews List
                        ReviewCard(name: "Jimmy Gusmanos", role: "Software Engineer", review: "JobAll changed my life! Within a week, I landed my dream job."),
                        ReviewCard(name: "Bob Builder", role: "Marketing Specialist", review: "Great platform, but I'd love to see more international jobs!"),
                        ReviewCard(name: "Ma'am Amuh", role: "Graphic Designer", review: "Finding remote work has never been easier! Highly recommended."),
                        ReviewCard(name: "John Patrick Gozon", role: "HR Manager", review: "We found some of our best employees through this platform!"),
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

// 📌 Review Card Widget with Border
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
        border: Border.all(color: Color(0xFF23486A), width: 2), // Navy Blue Border
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
