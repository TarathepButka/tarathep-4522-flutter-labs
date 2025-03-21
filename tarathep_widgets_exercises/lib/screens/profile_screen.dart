import 'package:flutter/material.dart';
import '../widgets/local_image_asset.dart';
import '../widgets/custom_text_row.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String id;
  final String imagePath;
  final double imageWidth;
  final double imageHeight;
  final String photoCreditOwner;

  const ProfileScreen(
      {super.key,
      required this.name,
      required this.id,
      required this.imagePath,
      required this.imageWidth,
      required this.imageHeight,
      required this.photoCreditOwner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 47, 46, 46),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextRow(
              text1: name,
              text2: id,
            ),
            LocalImageAsset(
                imagePath: imagePath,
                imageWidth: imageWidth,
                imageHeight: imageHeight),
            CustomTextRow(
              text1: "Photo Credit:",
              text2: photoCreditOwner,
            )
          ],
        ));
  }
}
