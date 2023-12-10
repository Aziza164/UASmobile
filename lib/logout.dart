import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutPage extends StatelessWidget {
  final FirebaseAuth _authService = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to logout?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Perform logout logic
                await _authService.signOut();

                // Navigate to the login or home page after logout
                Navigator.pushReplacementNamed(context, '/login'); // Replace with your login page route
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
