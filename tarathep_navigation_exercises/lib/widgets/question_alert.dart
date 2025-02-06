import 'package:flutter/material.dart';

class QChoice extends StatefulWidget {
  final String text;
  final Color foreground, background;
  final bool isCorrect;
  final Widget nextQuestion;
  final int num;

  const QChoice({
    super.key,
    required this.text,
    this.foreground = Colors.white,
    this.background = Colors.white,
    this.isCorrect = false,
    required this.nextQuestion,
    required this.num,
  });

  @override
  State<QChoice> createState() => _QChoiceState();
}

class _QChoiceState extends State<QChoice> {
  late Color backgroundColor;
  bool? correct;

  @override
  void initState() {
    super.initState();
    backgroundColor = widget.background;
  }

  void _handleTap(BuildContext context, bool isCorrect) {
    setState(() {
      correct = widget.isCorrect;
      int score;
      if (isCorrect == true) {
        score = 1;
      } else {
        score = 0;
      }
      backgroundColor = widget.isCorrect ? Colors.green : Colors.red;
      Future.delayed(Duration(milliseconds: 50), () {
        _showDialog(context, score, isCorrect);
      });
    });
  }

  void _showDialog(BuildContext context, int score, bool isCorrect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Score!'),
          content: Text(isCorrect
              ? 'Congrats, you get $score point'
              : 'Sorry, you miss it!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return GestureDetector(
      onTap: () async {
        _handleTap(context, widget.isCorrect);
        await Future.delayed(Duration(seconds: 2));
        if (widget.num != 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.nextQuestion,
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                body: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                        side: BorderSide(color: Colors.orangeAccent),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    },
                    child: Text('Restart',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          );
        }
      },
      child: Container(
        width: isPortrait ? 160 : 280,
        height: isPortrait ? 80 : 50,
        margin: EdgeInsets.all(isPortrait ? 10 : 0),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.foreground,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
