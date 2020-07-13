import 'package:flutter/material.dart';
import '../constans.dart';

class Button extends StatelessWidget {
  final String buttonText;

  Button(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(kPrimaryColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(color: Color(0xffFBBC43), fontSize: 20),
        ),
      ),
    );
  }
}
