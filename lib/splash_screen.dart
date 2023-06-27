import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart'; // Ganti dengan file form login Anda

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                LoginPage()), // Ganti LoginForm dengan widget login Anda
      );
    });

    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/logo1.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
