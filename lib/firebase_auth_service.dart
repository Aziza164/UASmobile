import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  FirebaseAuth _authService = FirebaseAuth.instance;
  User? getCurrentUser() {
      return _authService.currentUser;
    }

    Future<void> signOut() async {
      await _authService.signOut();
    }

    Future createUserInFirestore(User user, String fullname) async {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!doc.exists) {
        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'fullname': fullname,
          'email': user.email,
        });
      }
    }


Future<User?> signUpWithEmailandPassword(String email, password, BuildContext context) async {
      try {
          UserCredential credential = await _authService.createUserWithEmailAndPassword(email: email, password: password);
            return credential.user;
      } catch (e) {
          final String errorMessage = e.toString();
          ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(errorMessage),
        backgroundColor: Colors.red,
          ),
      );
    }
  }        Future<User?> loginWithEmailandPassword( //mengatur proses login pada halaman login
        String email, password, BuildContext context) async {
      try {
        UserCredential credential = await _authService.signInWithEmailAndPassword(
        email: email, password: password);
      return credential.user;
      } catch (e) {
          final String errorMessage = e.toString();
        ScaffoldMessenger.of(context).showSnackBar( //jika terjadi kesalahan, makaakan muncul pesan error 
        SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red, 
          ),
        );
      }
    }
}