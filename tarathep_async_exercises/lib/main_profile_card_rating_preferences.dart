import 'package:flutter/material.dart';
import 'screens/profilecard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Card with Rating and Preferences',
      home: ProfileCard(),
    );
  }
}
