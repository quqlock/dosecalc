import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/splash_screen.dart';
import './app_localizations.dart';

void main() {
  runApp(new MaterialApp(home: new HomePage()));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoseCalc',
      theme: ThemeData(primaryColor: Color(0xff16325A)),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('de', 'DE'),
        Locale('pl', 'PL'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: SplashScreen(),
    );
  }
}
