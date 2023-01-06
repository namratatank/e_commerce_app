import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String title;
  void Function() onPressed;
   NavigationButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), backgroundColor: Colors.white),
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
  }
}
