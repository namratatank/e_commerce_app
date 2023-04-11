import 'dart:async';

import 'package:e_commerce_app/blocs/auth/auth_bloc.dart';
import 'package:e_commerce_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/bottombar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthBloc bloc) => bloc.state.userModel);
    Timer(Duration(seconds: 3), () {
      user != null
          ? Navigator.push(
              context, MaterialPageRoute(builder: (builder) => Dashboard()))
          : Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LoginScreen()));
    });
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        print('Splash screen auth listener');
      },
      child: Scaffold(
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
      ),
    );
  }
}
