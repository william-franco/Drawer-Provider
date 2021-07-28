import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:drawer_provider/providers/theme_provider.dart';
import 'package:drawer_provider/themes/custom_theme.dart';
import 'package:drawer_provider/widgets/appbar_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  final String title = 'Settings';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var _darkTheme = true;

  Future<void> _changeTheme(bool value, ThemeProvider themeProvider) async {
    (value)
        ? themeProvider.setTheme(darkTheme)
        : themeProvider.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkTheme', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBack(context, widget.title),
      body: _buildContents(context),
    );
  }

  Widget _buildContents(BuildContext context) {
    final themeNotifier = Provider.of<ThemeProvider>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return CupertinoScrollbar(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Theme'),
              subtitle: Text('Choose a theme for the app.'),
              trailing: Switch(
                value: _darkTheme,
                onChanged: (val) {
                  setState(() {
                    _darkTheme = val;
                  });
                  _changeTheme(val, themeNotifier);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
