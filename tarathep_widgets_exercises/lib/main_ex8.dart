import 'package:flutter/material.dart';
import 'screens/profile_witn_button.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Screen",
      home: ProfileWithButton(
        name: "Tarathep",
        id: "653040452-2",
        imagePath: "assets/gintama.jpg",
        imageWidth: 400,
        imageHeight: 250,
        photoCreditOwner: "Gintama",
      ),
    ));
