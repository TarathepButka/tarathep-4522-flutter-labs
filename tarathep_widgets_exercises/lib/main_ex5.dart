import 'package:flutter/material.dart';
import 'widgets/randomadd.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StatefulWidget: Random'),
          backgroundColor: const Color.fromARGB(255, 239, 204, 97),
          centerTitle: true,
        ),
        body: const MyHomePage("Tarathep 452-2"),
      ),
    );
  }
}
