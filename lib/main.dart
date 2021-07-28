import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:drawer_provider/providers/counter_provider.dart';
import 'package:drawer_provider/providers/drawer_provider.dart';
import 'package:drawer_provider/providers/theme_provider.dart';
import 'package:drawer_provider/routes/routes.dart';
import 'package:drawer_provider/themes/custom_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool('darkTheme') ?? false;
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(
              isDarkTheme ? darkTheme : lightTheme,
            ),
          ),
          ChangeNotifierProvider<DrawerProvider>(
            create: (context) => DrawerProvider(),
          ),
          ChangeNotifierProvider<CounterProvider>(
            create: (context) => CounterProvider(),
          ),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Drawer Provider',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getTheme(),
      routes: Routes.routes,
      initialRoute: Routes.splash,
    );
  }
}
