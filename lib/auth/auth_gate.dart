import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trafficopt/auth/login_register.dart';
import 'package:trafficopt/components/my_btn_nav.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //if user is logged in
            if (snapshot.hasData) {
              return BottomNavigation();
            } else {
              return LoginOrRegister();
            }
          }),
    );
  }
}