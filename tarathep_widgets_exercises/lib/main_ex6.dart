import 'package:flutter/material.dart';
import '../widgets/custom_font.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: CustomFont(
          text: 'Tarathep Butka',
          fontFamily: 'Prompt',
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
