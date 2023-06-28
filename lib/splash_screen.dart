import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
      );
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
