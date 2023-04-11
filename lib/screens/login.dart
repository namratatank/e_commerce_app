import 'package:e_commerce_app/cubit/cubits.dart';
import 'package:e_commerce_app/pages/bottombar.dart';
import 'package:e_commerce_app/repositories/auth/auth_repository.dart';
import 'package:e_commerce_app/screens/signup.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              child: BlocProvider(
                create: (_) => LoginCubit(context.read<AuthRepository>()),
                child: BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state.status == LoginStatus.error) {
                      // Do something if there is an error
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                        previous.email != current.email,
                        builder: (context, state) {
                          return TextFormField(
                            controller: emailController,
                            onChanged: (email) {
                              context.read<LoginCubit>().emailChanged(email);
                            },
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                        previous.password != current.password,
                        builder: (context, state) {
                          return TextFormField(
                            controller: passwordController,
                            onChanged: (password) {
                              context
                                  .read<LoginCubit>()
                                  .passwordChanged(password);
                            },
                            decoration: const InputDecoration(
                              hintText: 'Password',
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        child: BlocBuilder<LoginCubit, LoginState>(
                          buildWhen: (previous, current) =>
                          previous.status != current.status,
                          builder: (context, state) {
                            return state.status == LoginStatus.submitting
                                ? SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator())
                                : ElevatedButton(
                              onPressed: () {
                                context
                                    .read<LoginCubit>()
                                    .loginWithCredentials()
                                    .then(
                                      (value) =>
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  Dashboard())),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              child: const Text('Login'),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: BlocBuilder<LoginCubit, LoginState>(
                          buildWhen: (previous, current) =>
                          previous.status != current.status,
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () {
                                context
                                    .read<LoginCubit>()
                                    .loginWithGoogle();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey),
                              child: const Text(
                                'Sign in with Google',
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => SignUpScreen()));
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Dashboard()));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
