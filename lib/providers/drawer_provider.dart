import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier {
  void setItemDrawer() {
    notifyListeners();
  }
}
