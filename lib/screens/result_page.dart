import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../app_localizations.dart';
import '../constans.dart';
import '../widgets/button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.resultDose,
      @required this.resultTime,
      @required this.resultDoseWeek,
      @required this.resultDoseMonth,
      @required this.resultDoseQuarter,
      @required this.resultDoseYear});

  final double resultDose;
  final double resultTime;

  final String resultDoseWeek;
  final String resultDoseMonth;
  final String resultDoseQuarter;
  final String resultDoseYear;

  @override
  Widget build(BuildContext context) {
    String resultText = AppLocalizations.of(context).translate('resultDose') +
        ': ' +
        resultDose.toString() +
        ' [μSv], ' +
        AppLocalizations.of(context).translate('resultTime') +
        ': ' +
        resultTime.toString() +
        ' ' +
        AppLocalizations.of(context).translate('resultHours') +
        '\n' +
        AppLocalizations.of(context).translate('resultDoseWeek') +
        ': ' +
        resultDoseWeek +
        ' mSv\n' +
        AppLocalizations.of(context).translate('resultDoseMonth') +
        ': ' +
        resultDoseMonth +
        ' mSv\n' +
        AppLocalizations.of(context).translate('resultDoseQuarter') +
        ': ' +
        resultDoseQuarter +
        ' mSv\n' +
        AppLocalizations.of(context).translate('resultDoseYear') +
        ': ' +
        resultDoseYear +
        ' mSv';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('appTitle'),
        ),
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Share.share(
                        resultText +
                            '\n' +
                            AppLocalizations.of(context).translate('linkText'),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.share),
                          color: Color(kPrimaryColor),
                        ),
                        Text(AppLocalizations.of(context)
                            .translate('resultShare')),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Tooltip(
                        showDuration: Duration(seconds: 10),
                        height: 80,
                        message: AppLocalizations.of(context)
                            .translate('resultInfoText'),
                        child: IconButton(
                          icon: Icon(Icons.warning),
                          color: Color(kPrimaryColor),
                        ),
                      ),
                      Text(
                          AppLocalizations.of(context).translate('resultInfo')),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/startPage');
              },
              child: Button(
                AppLocalizations.of(context).translate('buttonNewCalc'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
