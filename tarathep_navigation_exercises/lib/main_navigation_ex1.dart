import 'package:flutter/material.dart';
import 'widgets/question_info.dart';

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
      home: Scaffold(
        body: const QuestionInfo(),
      ),
    );
  }
}
