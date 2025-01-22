import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  const ScoreScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score Report'),
        leading: Icon(Icons.arrow_back_ios),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your score is $score',
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 24),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Text('Back'))
          ],
        ),
      ),
    );
  }
}
