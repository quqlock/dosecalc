import 'package:flutter/material.dart';
import '../constans.dart';
import '../widgets/button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.resultText,
      @required this.resultDose,
      @required this.resultTime});
  final double resultDose;
  final double resultTime;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kTitleApp),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                resultText,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Button('Nowa kalkulacja'),
            ),
          ],
        ),
      ),
    );
  }
}
