import 'package:e_commerce_app/blocs/auth/auth_bloc.dart';
import 'package:e_commerce_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final user = context.select((AuthBloc bloc) => bloc.state.userModel);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        isBackArrow: false,
        isWishlistPage: true,
      ),
      body: user != null
          ? Center(
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    foregroundImage: NetworkImage(user.photo),
                    child: Icon(Icons.person),
                  ),
                  SizedBox(height: 20),
                  Text(
                    user.fullName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    user.email,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 200,
                    child: ElevatedButton(onPressed: (){
                      context.read<AuthBloc>().add( AppLogoutRequested());
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Text('Logout')),
                  )
                ],
              ),
          )
          : Center(
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
                            context,
                            MaterialPageRoute(
                                builder: (builder) => LoginScreen()));
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                    ),
                  ),
                  Container(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => SignUpScreen()));
                      },
                      child: Text('Signup'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
