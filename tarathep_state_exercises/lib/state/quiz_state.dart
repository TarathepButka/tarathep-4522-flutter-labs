import 'package:flutter/material.dart';

class QuizState extends ChangeNotifier {
  int totalScore = 0;

  void updateScore(int score) {
    totalScore += score;
    notifyListeners();
  }

  void resetScore() {
    totalScore = 0;
    notifyListeners();
  }
}
