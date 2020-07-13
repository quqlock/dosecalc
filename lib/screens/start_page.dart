import 'package:flutter/material.dart';
import '../app_localizations.dart';
import '../dose_calc.dart';
import '../widgets/button.dart';
import './result_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  double time = 0.00;
  double dose = 0.00;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).translate('appTitle'),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                        onChanged: (value) {
                          dose = double.parse(value.replaceAll(',', '.'));
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          icon: Icon(Icons.pages),
                          labelText: AppLocalizations.of(context)
                              .translate('inputDose'),
                          labelStyle: TextStyle(fontSize: 20),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: AppLocalizations.of(context)
                              .translate('inputDoseHint'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: TextFormField(
                        onChanged: (value) {
                          time = double.parse(value.replaceAll(',', '.'));
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          icon: Icon(Icons.access_time),
                          labelText: AppLocalizations.of(context)
                              .translate('inputTime'),
                          labelStyle: TextStyle(fontSize: 20),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: AppLocalizations.of(context)
                              .translate('inputTimeHint'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (time != 0.00 && dose != 0.00) {
                          DoseCalc calc = DoseCalc(dose: dose, time: time);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                resultDose: dose,
                                resultTime: time,
                                resultDoseWeek: calc.getDoseWeek(),
                                resultDoseMonth: calc.getDouseMonth(),
                                resultDoseQuarter: calc.getDoseQuarter(),
                                resultDoseYear: calc.getDoseYear(),
                              ),
                            ),
                          );
                        }
                      },
                      child: Button(
                          AppLocalizations.of(context).translate('buttonCalc')),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
