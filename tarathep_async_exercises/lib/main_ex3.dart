import 'package:flutter/material.dart';
import 'package:tarathep_async_exercises/screens/newslist_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Albums',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewslistScreen(),
    );
  }
}
