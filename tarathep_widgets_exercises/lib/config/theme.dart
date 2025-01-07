import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Colors.deepOrange;
  static const Color backgroundColor = Color.fromARGB(255, 85, 115, 214);
  static const Color overlayColor = Colors.white;

  // Text Styles
  static const TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle nameStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  // Spacing
  static const double defaultPadding = 20.0;
  static const double cardPadding = 16.0;
}
