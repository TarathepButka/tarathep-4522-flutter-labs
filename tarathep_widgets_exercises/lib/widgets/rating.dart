import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  final Color defaultColor;
  final Color ratingColor;

  const Ratings(
      {super.key, required this.defaultColor, required this.ratingColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            Icons.star,
            color: index < 4 ? ratingColor : defaultColor,
          ),
        );
      }),
    );
  }
}
