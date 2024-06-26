import 'package:bynryapp/authentication/login/login.dart';
import 'package:bynryapp/home/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in

          if (snapshot.hasData) {
            return const HomeScreen();
          }
          // user not logged in
          else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
