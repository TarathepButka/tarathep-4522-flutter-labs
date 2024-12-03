import 'package:flutter/material.dart';

void main() => runApp(const FavoriteQuoteApp());

class FavoriteQuoteApp extends StatelessWidget {
  const FavoriteQuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Favorite Quote'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset('assets/quote_image.png'),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 2,
                  ),
                ),
                child: const Text(
                  'Anton Chekhov',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
