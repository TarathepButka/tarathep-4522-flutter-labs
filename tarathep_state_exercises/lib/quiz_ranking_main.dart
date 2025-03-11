import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarathep_navigation_exercises/screen/start_screen.dart';
import 'package:tarathep_state_exercises/screen/quiz_stat_ranking_screen.dart';
import 'state/quiz_state.dart';
import 'widget/question_info_with_nav_alert_stat.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuizState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/question1': (context) => const QuestionInfo(),
        '/restart': (context) => const QuizStatRankScreen()
      },
    );
  }
}
