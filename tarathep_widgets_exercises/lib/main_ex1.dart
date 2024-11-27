import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tarathep Butka',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('653040452-2',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.cyan)),
            ],
          ),
        ),
      ),
    ));
