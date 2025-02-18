import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/quiz_state.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<QuizState>(
          builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your total score is: ${provider.totalScore}',
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
                SizedBox(
                  width: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.resetScore();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: Text('Restart'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
