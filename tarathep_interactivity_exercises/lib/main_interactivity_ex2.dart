import 'package:flutter/material.dart';
import 'package:tarathep_interactivity_exercises/widgets/interact_quiz_question.dart';
import 'package:tarathep_interactivity_exercises/widgets/interact_question.dart';

void main() {
  runApp(const ResponsiveQuizApp());
}

class ResponsiveQuizApp extends StatelessWidget {
  const ResponsiveQuizApp({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    const String appTitle = "Quiz App by 653040452-2";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Exercise',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: isPortrait ? AppBar(title: const Text(appTitle)) : null,
        body: const Question(
          question: "Where is the picture?",
          imagepath: "assets/kku.jpg",
          choices: [
            QChoice(
                text: "Chiang Mai University",
                background: Colors.purple,
                foreground: Colors.white),
            QChoice(
              text: "Khon Kaen University",
              background: Colors.orange,
              foreground: Colors.white,
              isCorrect: true,
            ),
            QChoice(
                text: "Chulalongkorn University",
                background: Colors.pink,
                foreground: Colors.white),
            QChoice(
                text: "Mahidol University",
                background: Colors.blue,
                foreground: Colors.white),
          ],
        ),
      ),
    );
  }
}
