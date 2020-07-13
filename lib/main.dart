import 'package:flutter/material.dart';
import 'constans.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(new MaterialApp(home: new HomePage()));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kTitleApp,
      theme: ThemeData(primaryColor: Color(0xff16325A)),
      home: SplashScreen(),
    );
  }
}
