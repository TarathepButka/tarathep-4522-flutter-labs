import 'package:flutter/material.dart';

class QChoice extends StatefulWidget {
  final String text;
  final Color foreground, background;
  final bool isCorrect;

  const QChoice({
    super.key,
    required this.text,
    this.foreground = Colors.white,
    this.background = Colors.white,
    this.isCorrect = false,
  });

  @override
  State<QChoice> createState() => _QChoiceState();
}

class _QChoiceState extends State<QChoice> {
  late Color backgroundColor;

  @override
  void initState() {
    super.initState();
    backgroundColor = widget.background;
  }

  void _handleTap(BuildContext context) {
    setState(() {
      backgroundColor = widget.isCorrect ? Colors.green : Colors.red;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.isCorrect ? 'Your score is 1' : 'Your score is 0',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: widget.isCorrect ? Colors.green : Colors.red,
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return GestureDetector(
      onTap: () => _handleTap(context),
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
