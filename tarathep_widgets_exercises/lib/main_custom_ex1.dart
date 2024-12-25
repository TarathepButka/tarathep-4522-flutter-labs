import 'package:flutter/material.dart';
import 'package:tarathep_widgets_exercises/widgets/choice.dart';
import 'package:tarathep_widgets_exercises/widgets/question_with_choice.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizApp(),
  ));
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App by 653040452-2'),
      ),
      body: const QuestionWithChoice(
        question: "Where is this picture?",
        imagepath: 'assets/kku.jpg',
        choices: [
          Choice(
              text: "Chiang Mai University",
              backgroundcolor: Colors.purple,
              foregroundcolor: Colors.white),
          Choice(
              text: "Khon Kaen University",
              backgroundcolor: Colors.orange,
              foregroundcolor: Colors.white),
          Choice(
              text: "Chulalongkorn University",
              backgroundcolor: Colors.pink,
              foregroundcolor: Colors.white),
          Choice(
              text: "Mahidol University",
              backgroundcolor: Colors.blue,
              foregroundcolor: Colors.white),
        ],
      ),
    );
  }
}
