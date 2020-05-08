import 'dart:async';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'main.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage(
      {this.savePreferences,
      this.toggleTheme,
      this.darkEnabled,
      this.themeMode,
      this.switchOLED,
      this.darkOLED});
  final Function savePreferences;
  final Function toggleTheme;
  final bool darkEnabled;
  final String themeMode;
  final Function switchOLED;
  final bool darkOLED;

  @override
  SettingsPageState createState() => new SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  _confirmDeletePortfolio() {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text("Clear Portfolio?"),
            content: new Text("This will permanently delete all transactions."),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () async {
                    await _deletePortfolio();
                    Navigator.of(context).pop();
                  },
                  child: new Text("Delete")),
              new FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: new Text("Cancel"))
            ],
          );
        });
  }

  Future<Null> _deletePortfolio() async {
    getApplicationDocumentsDirectory().then((Directory directory) {
      File jsonFile = new File(directory.path + "/portfolio.json");
      jsonFile.delete();
      portfolioMap = {};
    });
  }

  _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String version = "";
  String buildNumber = "";
  _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }

  void initState() {
    super.initState();
    _getVersion();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: new AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          titleSpacing: 0.0,
          elevation: appBarElevation,
          title: new Text("Settings", style: Theme.of(context).textTheme.title),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Text("Preferences",
                style: Theme.of(context).textTheme.body2),
          ),
          new Container(
              color: Theme.of(context).cardColor,
              child: new ListTile(
                onTap: widget.toggleTheme,
                leading: new Icon(widget.darkEnabled
                    ? Icons.brightness_3
                    : Icons.brightness_7),
                subtitle: new Text(widget.themeMode),
                title: new Text("Theme"),
              )),
          new Container(
            color: Theme.of(context).cardColor,
            child: new ListTile(
              leading: new Icon(Icons.opacity),
              title: new Text("OLED Dark Mode"),
              trailing: new Switch(
                activeColor: Theme.of(context).accentColor,
                value: widget.darkOLED,
                onChanged: (onOff) {
                  widget.switchOLED(state: onOff);
                },
              ),
              onTap: widget.switchOLED,
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Text("Debug", style: Theme.of(context).textTheme.body2),
          ),
          new Container(
            color: Theme.of(context).cardColor,
            child: new ListTile(
              title: new Text("Issues & Feature Requests"),
              leading: new Icon(Icons.bug_report),
              onTap: () =>
                  _launchUrl("https://github.com/trentpiercy/trace/issues"),
            ),
          ),
          new Container(
            color: Theme.of(context).cardColor,
            child: new ListTile(
              title: new Text("Version $version ($buildNumber)"),
              subtitle: new Text("github.com/trentpiercy/trace"),
              leading: new Icon(Icons.info_outline),
              onTap: () => _launchUrl("https://github.com/trentpiercy/trace"),
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Text("Credit", style: Theme.of(context).textTheme.body2),
          ),
          new Container(
            color: Theme.of(context).cardColor,
            child: new ListTile(
              title: new RichText(
                  text: new TextSpan(
                      text: "Maintained with love by ",
                      style: Theme.of(context).textTheme.subhead,
                      children: <TextSpan>[
                    TextSpan(
                        text: "@TrentPiercy",
                        style: Theme.of(context).textTheme.subhead.apply(
                            color: Theme.of(context).buttonColor,
                            fontWeightDelta: 2))
                  ])),
              subtitle: new Text("twitter.com/trentpiercy"),
              leading: new Icon(Icons.favorite),
              onTap: () => _launchUrl("https://twitter.com/trentpiercy"),
            ),
          ),
        ],
      ),
    );
  }
}
