import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Settings'),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Divider(height: 20, thickness: 2, color: Colors.grey[400]),
            ListTile(
              title: const Text(
                'Account',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              onTap: () {
                // Navigate to account settings
                // You can replace this with the appropriate navigation logic
              },
            ),
            ListTile(
              title: const Text(
                'My Information',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              onTap: () {
                // Navigate to my information settings
                // You can replace this with the appropriate navigation logic
              },
            ),
            ListTile(
              title: const Text(
                'F.A.Q',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              onTap: () {
                // Navigate to F.A.Q settings
                // You can replace this with the appropriate navigation logic
              },
            ),
            ListTile(
              title: const Text(
                'Promo Codes',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              onTap: () {
                // Navigate to promo codes settings
                // You can replace this with the appropriate navigation logic
              },
            ),
            Spacer(),
            ListTile(
              title: const Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                // Implement log out functionality
                // You can replace this with the appropriate logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
