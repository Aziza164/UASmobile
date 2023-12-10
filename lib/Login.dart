import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/firebase_auth_service.dart';
import 'package:flutter_application_3/home.dart';
import 'package:flutter_application_3/Register.dart';
import 'package:flutter_application_3/intro.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _authService.loginWithEmailandPassword(
      email,
      password,
      context,
    );
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login success"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login failed"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Color.fromARGB(255, 43, 128, 125), // Ganti dengan warna yang diinginkan
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               Text(
                "LOGIN",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                  SizedBox(
                    height: 20,
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
                  const SizedBox(
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
                        login();
                      },
                      child: const Text(
                        "Login",
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
                      const Text("Don’t have an account?"),
                      const SizedBox(width: 4.0),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Register(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register.",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0), // Add some space between "Register" and "Or sign in with"
                  Container(
                    width: 143,
                    height: 28,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
