import 'package:e_commerce_app/cubit/signup/sign_up_cubit.dart';
import 'package:e_commerce_app/repositories/auth/auth_repository.dart';
import 'package:e_commerce_app/repositories/auth/base_auth_repository.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/bottombar.dart';

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
            child: BlocProvider<SignUpCubit>(
              create: (_) => SignUpCubit(context.read<AuthRepository>()),
              child: BlocListener<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state.status == SignupStatus.error) {
                    // Do something if there is an error
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    BlocBuilder<SignUpCubit, SignUpState>(
                      buildWhen: (previous, current) =>
                          previous.email != current.email,
                      builder: (context, state) {
                        return TextFormField(
                          controller: emailController,
                          onChanged: (email) {
                            context.read<SignUpCubit>().emailChanged(email);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Email',
                          ),
                        );
                      },
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
                    BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        return TextFormField(
                          controller: passwordController,
                          onChanged: (password) {
                            context
                                .read<SignUpCubit>()
                                .passwordChanged(password);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 200,
                      child: BlocBuilder<SignUpCubit, SignUpState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status,
                        builder: (context, state) {
                          return state.status == SignupStatus.submitting
                              ? const SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator())
                              : ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<SignUpCubit>()
                                        .signupFormSubmitted()
                                        .then(
                                          (value) => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      Dashboard())),
                                        );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  child: const Text('Sign up'),
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
