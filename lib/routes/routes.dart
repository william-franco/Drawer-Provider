import 'package:flutter/material.dart';

// Routes
import 'package:drawer_provider/screens/home_screen.dart';
import 'package:drawer_provider/screens/intro_screen.dart';
import 'package:drawer_provider/screens/setting_screen.dart';
import 'package:drawer_provider/screens/splash_screen.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String home = '/home';
  static const String setting = '/setting';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    intro: (BuildContext context) => IntroScreen(),
    home: (BuildContext context) => HomeScreen(),
    setting: (BuildContext context) => SettingScreen(),
  };
}
