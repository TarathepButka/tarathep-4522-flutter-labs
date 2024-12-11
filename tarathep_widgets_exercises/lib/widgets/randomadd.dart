import 'package:flutter/material.dart';
import 'dart:math';


class MyHomePage extends StatefulWidget {
  final String nameandID;
  const MyHomePage(this.nameandID, {super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int randomSum = 0;
  int num1 = 0;
  int num2 = 0;

  void generateRandomNumbers() {
    final random = Random();
    num1 = random.nextInt(10) + 1;
    num2 = random.nextInt(10) + 1;
    setState(() {
      randomSum = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.nameandID;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: generateRandomNumbers,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '$num1 + $num2 = $randomSum',
                style: const TextStyle(
                  backgroundColor: Color.fromARGB(255, 239, 204, 97),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
