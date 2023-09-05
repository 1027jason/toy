import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color textcolor;
  final Color bdColor;

  const Button(
      {super.key,
      required this.text,
      required this.textcolor,
      required this.bdColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bdColor,
        borderRadius: BorderRadius.circular(80),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 30),
        child:
            Text('Request', style: TextStyle(color: textcolor, fontSize: 22)),
      ),
    );
  }
}
