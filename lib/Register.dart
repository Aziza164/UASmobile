import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Login.dart';
import 'package:flutter_application_3/firebase_auth_service.dart';
import 'package:flutter_application_3/home.dart';
import 'package:flutter_application_3/intro.dart';

class Register extends StatefulWidget {
   const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
void register() async {
  String fullname = _fullNameController.text;
  String email = _emailController.text;
  String password = _passwordController.text;

  User? user = await _authService.signUpWithEmailandPassword(
    email, password, context);

  if (user != null) {
    await _authService.createUserInFirestore(user, fullname);
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User is successfully created"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Cannot Create User!"),
      backgroundColor: Colors.red,
    ));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Color.fromARGB(255, 43, 128, 125), // Ganti dengan warna yang diinginkan
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "REGISTER",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Full Name",
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  hintText: "Password",
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF22C1CB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    register();
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()));
                    },
                    child: Text(
                      "Login.",
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}