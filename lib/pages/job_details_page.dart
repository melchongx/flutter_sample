import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'application_process_page.dart';

class JobDetailsPage extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String location;
  final String logo;
  final String description;
  final String? requirements;
  final String? jobType;
  final String? postedAt;
  final String applicationUrl;

  const JobDetailsPage({
    super.key,
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.logo,
    required this.description,
    this.requirements,
    this.jobType,
    this.postedAt,
    required this.applicationUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF23486A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          // Company Logo Header
            Container(
              height: 200,
              color: Colors.grey[200],
              child: Center(
                child: Image.asset(
                  'assets/building.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.business,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Job Title and Company Info
              Text(
                jobTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF23486A),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(Icons.business, color: Color(0xFF5B913B)),
                  const SizedBox(width: 8),
                  Text(
                    company,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF5B913B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Color(0xFF23486A)),
                  const SizedBox(width: 8),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF23486A),
                    ),
                  ),
                ],
              ),
              const Divider(height: 40),

              // Job Details Sections
              if (jobType != null)
                _buildDetailSection(
                  icon: Icons.work_outline,
                  title: 'Job Type',
                  items: [jobType!],
                ),

              if (postedAt != null)
                _buildDetailSection(
                  icon: Icons.calendar_today,
                  title: 'Posted Date',
                  items: [postedAt!],
                ),

              _buildDetailSection(
                icon: Icons.description,
                title: 'Job Description',
                content: description,
              ),

              if (requirements != null && requirements!.isNotEmpty)
                _buildDetailSection(
                  icon: Icons.list_alt,
                  title: 'Requirements',
                  content: requirements!,
                ),
            ],
          ),
        ),
        // Big Apply Now Button
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B913B),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ApplicationProcessPage(),
                ),
              ),
              child: const Text(
                'APPLY NOW',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),

      ],
    ),
    ),
    );
  }

  Widget _buildDetailSection({
    required IconData icon,
    required String title,
    List<String>? items,
    String? content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF23486A)),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF23486A),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (items != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) =>
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text('• $item'),
                )).toList(),
          ),
        if (content != null)
          Html(
            data: content,
            style: {
              "body": Style(
                margin: Margins.zero,
                fontSize: FontSize(16),
                lineHeight: const LineHeight(1.5),
              ),
            },
          ),
        const SizedBox(height: 30),
      ],
    );
  }
}