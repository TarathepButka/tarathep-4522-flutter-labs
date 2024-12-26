import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  final String imageFile;
  final String name;

  const ContactImage({super.key, required this.imageFile, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imageFile),
          radius: 160,
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          ),
        )
      ],
    );
  }
}
