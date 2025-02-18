import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/home_screen.dart';
import 'state/theme_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(
      builder: (context, themeState, _) {
        return MaterialApp(
          title: 'Theme Switcher',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor:
                themeState.isDark ? Colors.grey[900] : Colors.white,
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                color: themeState.isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
