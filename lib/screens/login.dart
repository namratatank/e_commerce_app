import 'package:e_commerce_app/pages/dashboard.dart';
import 'package:e_commerce_app/screens/signup.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Login',
        isBackArrow: false,
        isWishlistPage: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      child: const Text('Login'),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                      child: const Text('Sign in with Google', style: TextStyle(color: Colors.black),),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account? please"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=> SignUpScreen()));
                        },
                        style: TextButton.styleFrom(foregroundColor: Colors.black),
                        child: const Text(
                          'Sign up',
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>Dashboard()));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              child: const Text(
                'Skip',
                style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
