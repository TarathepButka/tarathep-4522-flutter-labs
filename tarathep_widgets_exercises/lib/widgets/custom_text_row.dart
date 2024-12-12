import 'package:flutter/material.dart';

class CustomTextRow extends StatelessWidget {
  final String text1, text2;

  const CustomTextRow({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text1,
            style: const TextStyle(fontSize: 22.0, color: Colors.yellowAccent),
          ),
        ),
        Expanded(
          child: Text(
            text2,
            style: const TextStyle(fontSize: 22.0, color: Colors.yellowAccent),
          ),
        )
      ],
    );
  }
}
