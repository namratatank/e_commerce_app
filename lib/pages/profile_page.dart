import 'package:flutter/material.dart';

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
      ),
    );
  }
}
