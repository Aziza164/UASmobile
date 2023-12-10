import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/home.dart';
import 'Login.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _authService = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 136, 157),
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // Add other style properties as needed
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 136, 157),
              ),
              child: Text('Welcome To Catatan Keuangan'),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: const Text('Logout'),
              onTap: () async {
                await _authService.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 45, 136, 157),
        ),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: Text('No Data Available'));
            }
            var userData = snapshot.data!.data() as Map<String, dynamic>?;

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Header Container
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 45, 136, 157),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // Profile Title Container
                          SizedBox(height: 20),
                          // User Avatar
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage(
                                'images/de43b96eb7cfed0cb99aa4ed1ff813e2.jpg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Rest of your widgets...
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
