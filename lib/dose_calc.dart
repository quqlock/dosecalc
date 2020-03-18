import 'screens/start_page.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'constans.dart';
import 'dart:math';

class DoseCalc {
  DoseCalc({this.dose, this.time});

  final double dose;
  final double time;

  double _resultDouble;

  String calcDose() {
    double _resultDouble = pow(dose, 2) * pow(time, 2);
    return _resultDouble.toStringAsFixed(2);
  }

  String getDose() {
    String resultWeek = '';
    String resultQuarter = '';
    String resultMonth = '';
    String resultYear = '';
    String result = '';

    if (_resultDouble != 0.00) {
      resultWeek =
          ((dose * time * kDateTimeWeek) / 1000).toStringAsFixed(kDecimals);
      resultMonth =
          ((dose * time * kDateTimeMonth) / 1000).toStringAsFixed(kDecimals);
      resultQuarter =
          ((dose * time * kDateTimeQuarter) / 1000).toStringAsFixed(kDecimals);
      resultYear =
          ((dose * time * kDateTimeYear) / 1000).toStringAsFixed(kDecimals);
      result = 'Dawka: $dose [μSv], Czas: $time [h]\n'
              'Dawka na tydzień: ' +
          resultWeek +
          ' mSv\nDawka na miesiąc:  ' +
          resultMonth +
          ' mSv\nDawka na kwartał: ' +
          resultQuarter +
          ' mSv\nDawka na rok: ' +
          resultYear +
          ' mSv';
      return result.toString();
    } else {
      return null;
    }
  }
}
