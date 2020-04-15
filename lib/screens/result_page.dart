import 'package:flutter/material.dart';
import '../constans.dart';

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
            Container(
              child: FlatButton(
                child: Text('Nowa kalkulacja'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
