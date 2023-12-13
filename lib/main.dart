import 'package:flutter/material.dart';
import 'package:flutter_application_3/Login.dart';
import 'package:flutter_application_3/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_3/home.dart';
import 'package:flutter_application_3/intro.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:209871036016:android:8f5f014a5efe716fc8deb5',
      apiKey: 'AIzaSyCsC-mNwJzHUhUuYU68Af8ZACjJvEAj9Hg',
      messagingSenderId: '209871036016',
      projectId: 'mobile-7aeaf',
      deepLinkURLScheme: 'bwG7oBU588SuPOCTL4w7',
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro Screen Demo',
      home: IntroPage(), // Change to IntroPage as the initial page
      debugShowCheckedModeBanner: false, // Set to false to remove the debug banner
    );
  }
}
