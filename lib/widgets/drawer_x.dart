import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_localizations.dart';
import '../constans.dart';

class DrawerX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: DrawerHeader(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context).translate('appTitle'),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context).translate('appFor'),
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/aboutPage');
            },
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text(
                AppLocalizations.of(context).translate("menuAbout"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (await canLaunch(kUrl)) {
                await launch(kUrl);
              }
            },
            child: ListTile(
              leading: Icon(Icons.link),
              title: Text(
                AppLocalizations.of(context).translate("menuLink"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
