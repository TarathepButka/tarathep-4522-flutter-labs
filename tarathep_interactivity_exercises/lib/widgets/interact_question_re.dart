import 'package:flutter/material.dart';
import 'package:tarathep_interactivity_exercises/widgets/interact_quiz_question_re.dart';

class MyQuestion extends StatelessWidget {
  final String title, question;
  final String imagepath;
  final List<String> choice;
  final List<bool> corrects;

  const MyQuestion(
      {super.key,
      required this.question,
      required this.imagepath,
      required this.choice,
      required this.corrects,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    String appTitle = "Quiz App by 653040452-2";
    return Scaffold(
        appBar: isPortrait
            ? AppBar(
                title: Text(appTitle),
                centerTitle: true,
              )
            : null,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  question,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                    color: Colors.pink,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Image.asset(imagepath,
                    height: isPortrait ? 200 : 140, fit: BoxFit.cover),
                const SizedBox(height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        QChoice(
                          text: choice[0],
                          background: Colors.purple,
                          foreground: Colors.white,
                          isCorrect: corrects[0],
                        ),
                        QChoice(
                          text: choice[1],
                          background: Colors.orange,
                          foreground: Colors.white,
                          isCorrect: corrects[1],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        QChoice(
                          text: choice[2],
                          background: Colors.pink,
                          foreground: Colors.white,
                          isCorrect: corrects[2],
                        ),
                        QChoice(
                          text: choice[3],
                          background: Colors.blue,
                          foreground: Colors.white,
                          isCorrect: corrects[3],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
