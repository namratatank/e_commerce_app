import 'package:e_commerce_app/repositories/auth/auth_repository.dart';
import 'package:e_commerce_app/repositories/auth/base_auth_repository.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sign Up',
        isWishlistPage: true,
        onBackPress: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: countryController,
                  decoration: const InputDecoration(
                    hintText: 'Country',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    hintText: 'City',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    hintText: 'Address',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: zipCodeController,
                  decoration: const InputDecoration(
                    hintText: 'ZIP Code',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('Sign Up'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
