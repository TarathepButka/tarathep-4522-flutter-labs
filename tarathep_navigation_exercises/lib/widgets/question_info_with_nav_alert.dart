import 'package:flutter/material.dart';
import 'package:tarathep_navigation_exercises/widgets/quiz_with_nav_alert.dart';

class QuestionInfo extends StatefulWidget {
  const QuestionInfo({
    super.key,
  });

  @override
  State<QuestionInfo> createState() => _QuestionInfoState();
}

class _QuestionInfoState extends State<QuestionInfo> {
  var prezQinfo = {
    1: {
      "title": 'Question 1',
      "question": "Where is the picture?",
      "imagepath": "assets/kku.jpg",
      "choice": [
        "Chiang Mai University",
        "Khon Kaen University",
        "Chulalongkorn University",
        "Mahidol University"
      ],
      "corrects": [false, true, false, false],
    },
    2: {
      "title": 'Question 2',
      "question": "What is this?",
      "imagepath": "assets/kku.jpg",
      "choice": ["CMU", "KKU", "CU", "MU"],
      "corrects": [false, true, false, false],
    },
    3: {
      "title": 'Question 3',
      "question": "What is this university?",
      "imagepath": "assets/kku.jpg",
      "choice": ["CMU", "KKU", "CU", "MU"],
      "corrects": [false, true, false, false],
    },
  };

  @override
  Widget build(BuildContext context) {
    return MyQuestion(
      num: 1,
      info: prezQinfo,
    );
  }
}
