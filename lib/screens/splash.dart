import 'dart:async';

import 'package:flutter/material.dart';

import '../pages/dashboard.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => Dashboard()));
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.yellow,
              Colors.redAccent,
            ],
          ),
        ),
        child: const Center(
            child: Text(
          'Foodie',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
