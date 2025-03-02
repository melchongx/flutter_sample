import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color(0xFF28356C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Account Settings
            _buildSettingsCard(
              title: "Account Settings",
              children: [
                _buildSettingsTile(Icons.person, "Edit Profile", () {}),
                _buildSettingsTile(Icons.email, "Email Settings", () {}),
              ],
            ),

            // Notifications
            _buildSettingsCard(
              title: "Notifications",
              children: [
                SwitchListTile(
                  title: const Text("Enable Notifications"),
                  value: true, // Change value based on user preference
                  onChanged: (bool value) {},
                  activeColor: const Color(0xFF28356C),
                ),
              ],
            ),

            // Privacy
            _buildSettingsCard(
              title: "Privacy",
              children: [
                _buildSettingsTile(Icons.lock, "Change Password", () {}),
                _buildSettingsTile(Icons.visibility_off, "Two-Factor Authentication", () {}),
              ],
            ),

            // General
            _buildSettingsCard(
              title: "General",
              children: [
                _buildSettingsTile(Icons.language, "Language Settings", () {}),
                _buildSettingsTile(Icons.dark_mode, "Theme Mode", () {}),
              ],
            ),

            // Log Out
            _buildSettingsCard(
              title: " ",
              children: [
                _buildSettingsTile(Icons.exit_to_app, "Log Out", () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build each settings category card
  Widget _buildSettingsCard({required String title, required List<Widget> children}) {
    return Card(
      color: const Color(0xFFF5F5F5), // Background color for each category
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title.trim().isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF28356C),
                  ),
                ),
              ),
            ...children, // Insert the ListTiles/Switches inside the card
          ],
        ),
      ),
    );
  }

  // Helper function to build each settings option tile
  Widget _buildSettingsTile(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF28356C)),
      title: Text(text),
      onTap: onTap,
    );
  }
}
