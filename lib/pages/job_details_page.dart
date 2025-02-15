import 'package:flutter/material.dart';
import 'application_process_page.dart';

class JobDetailsPage extends StatelessWidget {
  final String jobTitle;
  final String company;

  const JobDetailsPage({
    super.key,
    required this.jobTitle,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(jobTitle),
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
                  company,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5B913B),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Location: New York, NY\n\n'
                      'Salary: \$120k - \$150k\n\n'
                      'Job Description: Lorem ipsum dolor sit amet...',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
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
