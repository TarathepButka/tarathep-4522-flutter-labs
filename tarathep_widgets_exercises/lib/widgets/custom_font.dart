import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomFont({
    Key? key,
    required this.text,
    required this.fontFamily,
    this.fontSize = 24.0,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0), // Adds margin around the container
      padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0), // Adds padding inside the container
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 144, 218, 88), // Background color
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.white, // Foreground color for contrast
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
