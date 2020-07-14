import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_localizations.dart';
import '../constans.dart';
import '../widgets/button.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('appTitle'),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 50.0, right: 8.0, bottom: 8.0),
                  child: GestureDetector(
                      onTap: () async {
                        if (await canLaunch(kUrl)) {
                          await launch(kUrl);
                        }
                      },
                      child: Image.asset('assets/images/quales_logo.png')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).translate('appTitle'),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).translate('aboutDesc'),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).translate('resultInfoText'),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Author: quqlock@gmail.com'),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Button(
                        AppLocalizations.of(context).translate('aboutButton'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
