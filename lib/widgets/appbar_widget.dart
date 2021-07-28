import 'package:flutter/material.dart';

// appbar of home
AppBar appBarHome(BuildContext context, String title) {
  return AppBar(
    centerTitle: false,
    title: Text(title),
    elevation: 0,
  );
}

// appbar that return to the old screen
AppBar appBarWithBack(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.of(context).pop(),
    ),
    centerTitle: false,
    title: Text(title),
    elevation: 0,
  );
}
