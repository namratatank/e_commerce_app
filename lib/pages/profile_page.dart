import 'package:e_commerce_app/screens/signup.dart';
import 'package:flutter/material.dart';

import '../screens/login.dart';
import '../widgets/custom_app_bar.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        isBackArrow: false,
        isWishlistPage: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are not logged in!'),
            SizedBox(height: 10),
            Container(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (builder) => LoginScreen()));
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
            ),
            Container(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (builder) => SignUpScreen()));
                },
                child: Text('Signup'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
