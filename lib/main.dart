import 'package:dosimetric_calc/screens/result_page.dart';
import 'package:dosimetric_calc/screens/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/splash_screen.dart';
import './app_localizations.dart';
import './screens/about_page.dart';

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
      routes: {
        '/': (context) => SplashScreen(),
        '/startPage': (context) => StartPage(),
        '/resultPage': (context) => ResultPage(),
        '/aboutPage': (context) => AboutPage(),
      },
      initialRoute: '/',
    );
  }
}
