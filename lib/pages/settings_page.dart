import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color(0xFF23486A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Account Settings",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF23486A),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person, color: Color(0xFF23486A)),
              title: const Text("Edit Profile"),
              onTap: () {
                // Add functionality for editing profile
              },
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Color(0xFF23486A)),
              title: const Text("Email Settings"),
              onTap: () {
                // Add functionality for email settings
              },
            ),
            const Divider(),
            const Text(
              "Notifications",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF23486A),
              ),
            ),
            const Divider(),
            SwitchListTile(
              title: const Text("Enable Notifications"),
              value: true,  // Change value based on user preference
              onChanged: (bool value) {
                // Handle notification toggle
              },
              activeColor: Color(0xFF23486A),
            ),
            const Divider(),
            const Text(
              "Privacy",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF23486A),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.lock, color: Color(0xFF23486A)),
              title: const Text("Change Password"),
              onTap: () {
                // Add functionality for changing password
              },
            ),
            ListTile(
              leading: const Icon(Icons.visibility_off, color: Color(0xFF23486A)),
              title: const Text("Two-Factor Authentication"),
              onTap: () {
                // Add functionality for 2FA
              },
            ),
            const Divider(),
            const Text(
              "General",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF23486A),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language, color: Color(0xFF23486A)),
              title: const Text("Language Settings"),
              onTap: () {
                // Add functionality for language settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode, color: Color(0xFF23486A)),
              title: const Text("Theme Mode"),
              onTap: () {
                // Add functionality for theme change
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Color(0xFF23486A)),
              title: const Text("Log Out"),
              onTap: () {
                // Add logout functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
