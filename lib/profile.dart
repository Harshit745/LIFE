import 'package:flutter/material.dart';
import 'auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.user;

    if (user == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            'No user logged in',
            style: TextStyle(color: Colors.white70),
          ),
        ),
      );
    }

    final email = user.email ?? 'Unknown';
    final initial = email.isNotEmpty ? email[0].toUpperCase() : '?';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 44,
              backgroundColor: Colors.blueAccent.withOpacity(0.2),
              child: Text(
                initial,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              email,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () async {
                await AuthService.signOut();
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sign out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
