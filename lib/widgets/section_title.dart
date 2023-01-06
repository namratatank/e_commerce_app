import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String? title;
  const SectionTitle({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title??'', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),)),
    );
  }
}
