import 'package:flutter/material.dart';
import 'application_process_page.dart';

class JobDetailsPage extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String location;
  final String logo;

  const JobDetailsPage({
    super.key,
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF23486A),
      ),
      body: Column(
        children: [
          Image.asset('assets/job-detail.jpg'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF23486A),
                  ),
                ),
                Row(
                  children: [
                    // Column 1: Image from a link
                    Column(
                      children: [
                        Image.network(
                          'https://api.allorigins.win/raw?url=$logo',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10), // Add spacing between columns

                    // Column 2: Company and Location
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            company,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5B913B),
                            ),
                          ),
                          Text(
                            location,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xFF23486A),
                      size: 36.0,
                    ),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF23486A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text('tite'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF23486A),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B913B),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApplicationProcessPage(),
                    ),
                  ),
                  child: const Text('Apply Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
