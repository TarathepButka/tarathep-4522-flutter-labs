import 'package:flutter/material.dart';
import 'package:tarathep_interactivity_exercises/widgets/interact_question_re.dart';

void main() {
  runApp(const InteractiveQuizApp2());
}

class InteractiveQuizApp2 extends StatelessWidget {
  const InteractiveQuizApp2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interactivity Exercise',
      home: Scaffold(
        body: const MyQuestion(
          title: 'Question 1',
          question: "Where is the picture?",
          imagepath: "assets/kku.jpg",
          choice: [
            "Chiang Mai University",
            "Khon Kaen University",
            "Chulalongkorn University",
            "Mahidol University"
          ],
          corrects: [false, true, false, false],
        ),
      ),
    );
  }
}
