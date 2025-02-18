import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/theme_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<ThemeState>(
          builder: (context, themeState, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current Theme:',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 24),
                ),
                Text(
                  themeState.themeName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: themeState.toggleTheme,
                  child: themeState.isDark
                      ? Text('Switch to Light Theme')
                      : Text('Switch to Dark Theme'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
