import 'package:flutter/material.dart';
import 'screen/start_screen.dart';
import 'widgets/question_info_with_nav_alert.dart';

void main() {
  runApp(const MyNavigationandAlertApp());
}

class MyNavigationandAlertApp  extends StatelessWidget {
  const MyNavigationandAlertApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation and Alert Exercise',
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/question1': (context) => const QuestionInfo(),
      },
    );
  }
}