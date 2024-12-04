import 'package:flutter/material.dart';
import '../widgets/pet.dart';

void main() => runApp(const PetScreen());

class PetScreen extends StatelessWidget {
  const PetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Pet App'),
          backgroundColor: Colors.amberAccent,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Pet(
                  'Dog',
                  Image.asset(
                    'assets/dog.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Pet(
                  'Cat',
                  Image.asset(
                    'assets/cat.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Pet(
                  'Fox',
                  Image.asset(
                    'assets/fennecfox.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
