import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:drawer_provider/providers/drawer_provider.dart';
import 'package:drawer_provider/routes/routes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  static final textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    final drawer = Provider.of<DrawerProvider>(context, listen: false);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Header"),
            padding: EdgeInsets.all(22.0),
          ),
          ListTile(
            title: Text(
              "Home",
              style: textStyle,
            ),
            leading: Icon(Icons.home),
            onTap: () {
              drawer.setItemDrawer();
              Navigator.of(context).pushReplacementNamed(Routes.home);
            },
          ),
          ListTile(
            title: Text(
              "Settings",
              style: textStyle,
            ),
            leading: Icon(Icons.settings),
            onTap: () {
              drawer.setItemDrawer();
              Navigator.of(context).popAndPushNamed(Routes.setting);
            },
          ),
        ],
      ),
    );
  }
}
