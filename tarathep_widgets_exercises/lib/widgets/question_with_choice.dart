import 'package:flutter/material.dart';
import 'package:tarathep_widgets_exercises/widgets/choice.dart';

class QuestionWithChoice extends StatelessWidget {
  final String question;
  final String imagepath;
  final List<Choice> choices;

  const QuestionWithChoice(
      {super.key,
      required this.question,
      required this.imagepath,
      required this.choices});

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
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
                height: isPortrait ? 200 : 160, fit: BoxFit.cover),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    choices[0],
                    choices[1],
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    choices[2],
                    choices[3],
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
