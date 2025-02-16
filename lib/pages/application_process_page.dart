import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'success_page.dart';

class ApplicationProcessPage extends StatefulWidget {
  const ApplicationProcessPage({super.key});

  @override
  State<ApplicationProcessPage> createState() => _ApplicationProcessPageState();
}

class _ApplicationProcessPageState extends State<ApplicationProcessPage> {
  PlatformFile? _selectedFile;
  String _coverLetter = '';
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _pickPDF() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        setState(() {
          _selectedFile = result.files.first;
          _errorMessage = null;
        });
      }
    } catch (e) {
      setState(() => _errorMessage = 'Failed to pick file: ${e.toString()}');
    }
  }

  void _submitApplication() {
    if (_selectedFile == null) {
      setState(() => _errorMessage = 'Please upload a PDF resume');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccessPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply Now'),
        backgroundColor: const Color(0xFF23486A),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Resume Upload Section
            _buildSectionHeader(Icons.upload_file, 'Upload Resume (PDF Only)'),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E8),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF23486A).withOpacity(0.3)),
              ),
              child: ListTile(
                leading: const Icon(Icons.insert_drive_file, color: Color(0xFF23486A)),
                title: Text(
                  _selectedFile?.name ?? 'No file selected',
                  style: TextStyle(
                    color: _selectedFile != null
                        ? const Color(0xFF23486A)
                        : Colors.grey[600],
                  ),
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B913B),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _pickPDF,
                  child: const Text('Choose File'),
                ),
              ),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),

            // Cover Letter Section
            const SizedBox(height: 30),
            _buildSectionHeader(Icons.description, 'Cover Letter (Optional)'),
            const SizedBox(height: 10),
            TextField(
              maxLines: 5,
              maxLength: 500,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFFF8E8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Write your cover letter here...',
                contentPadding: const EdgeInsets.all(16),
              ),
              onChanged: (value) => _coverLetter = value,
            ),
            const Text(
              'Max 500 characters',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),

            // Submit Button
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator(color: Color(0xFF5B913B)))
                  : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B913B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _submitApplication,
                child: const Text(
                  'SUBMIT APPLICATION',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF23486A)),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF23486A)),
        ),
      ],
    );
  }
}