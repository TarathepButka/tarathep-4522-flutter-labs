import 'package:flutter/material.dart';

class LocalImageAsset extends StatelessWidget {
  final String imagePath;
  final double imageWidth;
  final double imageHeight;

  const LocalImageAsset(
      {super.key,
      required this.imagePath,
      this.imageWidth = 200,
      this.imageHeight = 400});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(2.0),
      child: Image.asset(
        imagePath,
        width: imageWidth,
        height: imageHeight,
      ),
    );
  }
}
