import 'package:flutter/material.dart';
import '../constans.dart';
import '../dose_calc.dart';
import 'result_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  double time = 0.00;
  double dose = 0.00;

  @override
  void initState() {
    time = 0.00;
    dose = 0.00;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            kTitleApp,
          ),
        ),
        body: Center(
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
                        print('Dose:  $dose');
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(Icons.pages),
                        labelText: 'Dawka [μSv]',
                        labelStyle: TextStyle(fontSize: 20),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Podaj dawkę w μSv',
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
                        print('Time:  $time');
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time),
                        labelText: 'Czas [h]',
                        labelStyle: TextStyle(fontSize: 20),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Podaj czas pracy w h / tydzień',
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
                              resultText: calc.getDose(),
                              resultDose: dose,
                              resultTime: time,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text('Przelicz dawki'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
