import 'package:flutter/material.dart';
import 'screens/profile_screen.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Screen",
      home: ProfileScreen(
        name: "Tarathep",
        id: "653040452-2",
        imagePath: "assets/gintama.jpg",
        imageWidth: 400,
        imageHeight: 250,
        photoCreditOwner: "Gintama",
      ),
    ));
