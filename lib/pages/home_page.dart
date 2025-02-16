import 'package:flutter/material.dart';
import 'job_details_page.dart';
import 'application_process_page.dart';
import 'success_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              leading: const Icon(Icons.home, color: Color(0xFF23486A)),
              title: const Text('Home'),
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
          // Banner Image
          // Container(
          //   height: 150,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/jinx.jpg'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),

          // Section Title
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

          // Search Bar with Filter Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
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

          // "40 results found" text
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 4, bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "40 results found",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
          ),

          // Job Listings
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => JobCard(
                jobTitle: "Senior Developer ${index + 1}",
                company: "Tech Corp ${index + 1}",
                location: "Room & Building, Street, City",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobDetailsPage(
                      jobTitle: "Senior Developer ${index + 1}",
                      company: "Tech Corp ${index + 1}",
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Pagination Buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
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
                  onPressed: () {},
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

// Job Card Widget
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
          title: Text(jobTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          subtitle: Row(
            children: [
              const Icon(Icons.location_on, color: Color(0xFF23486A), size: 16),
              const SizedBox(width: 5),
              Text(location, style: const TextStyle(fontSize: 14, color: Color(0xFF23486A))),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward, color: Color(0xFF23486A)),
          onTap: onTap,
        ),
      ),
    );
  }
}
