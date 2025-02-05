import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Column(
            children: [
              SizedBox(height: 200),
              Image(
                image: AssetImage('assets/quiz.jpg'),
                width: 250,
              ),
              SizedBox(height: 10),
              Text(
                'Welcome to the Quiz App TB',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'by Tarathep Butka, 653040452-2',
                style: TextStyle(fontSize: 24, color: Colors.pink),
              ),
            ],
          )),
          SizedBox(height: 200),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/question1');
              },
              child: const Text(
                'Start Quiz',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
