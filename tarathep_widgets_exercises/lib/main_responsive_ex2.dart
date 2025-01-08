import 'package:flutter/material.dart';
import 'widgets/choice.dart';
import 'widgets/question_with_choice.dart';

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
        body: const QuestionWithChoice(
          question: "Where is the picture?",
          imagepath: "assets/kku.jpg",
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
      ),
    );
  }
}
