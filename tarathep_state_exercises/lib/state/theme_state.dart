import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  String get themeName => _isDark ? "Dark" : "Light";

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
