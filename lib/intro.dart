import 'package:flutter/material.dart';
import 'package:flutter_application_3/Login.dart';

class IntroPage extends StatelessWidget {
  final AssetImage backgroundImage = AssetImage('assets/images/Calendar, checklist and clock for time management.png');

  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 45, 136, 157),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: backgroundImage,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome to Catatan Keuangan",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  navigateToLogin(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: const Color(0xFF22C1CB),
                ),
                child: Text("Get Started"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
