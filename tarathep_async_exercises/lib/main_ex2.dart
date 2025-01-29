import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class User {
  final String name;
  final String company;

  User({required this.name, required this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], company: json['company']['name']);
  }
}

Future<User> fetchUser() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercise2 by Tarathep 4522'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<User>(
            future: fetchUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    children: <TextSpan>[
                      TextSpan(
                          text: snapshot.data!.name,
                          style: TextStyle(color: Colors.red)),
                      TextSpan(
                        text: ' works at\n',
                      ),
                      TextSpan(
                          text: snapshot.data!.company,
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
