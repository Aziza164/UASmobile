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
        color: Color.fromARGB(255, 43, 128, 125), 
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
              Center(
                child: Text(
                  "Welcome to Catatan Keuangan",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center, // Align the text in the center
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  navigateToLogin(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  fixedSize: Size(200, 50), // Adjust the width and height as needed
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
