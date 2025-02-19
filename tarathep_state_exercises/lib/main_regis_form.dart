import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarathep_state_exercises/screen/form_screen.dart';
import 'state/registration_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RegistrationState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormScreen(),
    );
  }
}
