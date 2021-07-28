import 'package:drawer_provider/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      // If this is not the first time the application has been opened, start page.
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      prefs.setBool('seen', true);
      // If this is the first time the app has been opened, slide presentation.
      Navigator.of(context).pushReplacementNamed(Routes.intro);
    }
  }

  @override
  void initState() {
    super.initState();
    _checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
