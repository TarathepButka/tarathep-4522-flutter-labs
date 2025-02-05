import 'package:flutter/material.dart';
import 'screen/start_screen.dart';
import 'widgets/question_info_with_nav.dart';

void main() {
  runApp(const MyQuestionApp());
}

class MyQuestionApp extends StatelessWidget {
  const MyQuestionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Exercise',
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/question1': (context) => const QuestionInfo(),
      },
    );
  }
}
