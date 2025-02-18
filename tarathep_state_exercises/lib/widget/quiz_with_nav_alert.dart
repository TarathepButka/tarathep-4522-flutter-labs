import 'package:flutter/material.dart';
import '../screen/result.dart';
import 'question_alert.dart';

class MyQuestion extends StatefulWidget {
  final int num;
  final Map<dynamic, dynamic> info;

  const MyQuestion({super.key, required this.num, required this.info});

  @override
  State<MyQuestion> createState() => _MyQuestionState();
}

class _MyQuestionState extends State<MyQuestion> {
  late String title, question;
  late String imagepath;
  late List<String> choice;
  late List<bool> corrects;
  bool previous = false;
  Widget? nextQuestion;

  @override
  void initState() {
    super.initState();
    title = widget.info[widget.num]['title'];
    question = widget.info[widget.num]['question'];
    imagepath = widget.info[widget.num]['imagepath'];
    choice = widget.info[widget.num]['choice'];
    corrects = widget.info[widget.num]['corrects'];
    if (widget.num > 1 && widget.num <= widget.info.length) {
      previous = true;
    }
    if (widget.num < widget.info.length) {
      nextQuestion = MyQuestion(
        num: widget.num + 1,
        info: widget.info,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    String appTitle = "Quiz App by 653040452-2";
    return Scaffold(
        appBar: isPortrait
            ? AppBar(
                title: Text(appTitle,
                    style: const TextStyle(fontSize: 28, color: Colors.black)),
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
                  title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  question,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                    color: Colors.pink,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Image.asset(imagepath,
                    height: isPortrait ? 200 : 140, fit: BoxFit.cover),
                const SizedBox(height: 50),
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
                            nextQuestion: nextQuestion ?? Container(),
                            num: widget.num),
                        QChoice(
                            text: choice[1],
                            background: Colors.orange,
                            foreground: Colors.white,
                            isCorrect: corrects[1],
                            nextQuestion: nextQuestion ?? Container(),
                            num: widget.num)
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
                            nextQuestion: nextQuestion ?? Container(),
                            num: widget.num),
                        QChoice(
                            text: choice[3],
                            background: Colors.blue,
                            foreground: Colors.white,
                            isCorrect: corrects[3],
                            nextQuestion: nextQuestion ?? Container(),
                            num: widget.num)
                      ],
                    ),
                    SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: previous,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Previous',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.orangeAccent),
                            ),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/', (route) => false);
                          },
                          child: Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 16, color: Colors.blueAccent),
                          ),
                        ),
                        Spacer(),
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        nextQuestion ?? ResultScreen()),
                              );
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.greenAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
