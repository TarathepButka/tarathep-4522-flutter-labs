import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  final String text;
  final Color backgroundcolor;
  final Color foregroundcolor;

  const Choice(
      {super.key,
      required this.text,
      required this.backgroundcolor,
      required this.foregroundcolor});

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
        width: isPortrait ? 160 : 300,
        height: 60,
        margin: EdgeInsets.all(isPortrait ? 10 : 0),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundcolor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: foregroundcolor,
            ),
          ),
        ));
  }
}
