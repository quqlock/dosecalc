import 'package:flutter/material.dart';
import 'constans.dart';
import 'screens/start_page.dart';

void main() {
  runApp(new MaterialApp(home: new HomePage()));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kTitleApp,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: StartPage(),
    );
  }
}
