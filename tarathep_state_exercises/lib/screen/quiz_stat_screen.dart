import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/score.dart';
import '../state/quiz_state.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabases();
    return _database!;
  }

  Future<Database> initDatabases() async {
    String path = join(await getDatabasesPath(), 'scores.db');
    debugPrint('Database path: $path');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  FutureOr<void> _createDb(Database db, int version) {
    db.execute('''
      CREATE TABLE scoresHistory(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        score INTEGER
      )
    ''');
  }

  Future<int> insertScore(int score) async {
    Database db = await database;
    return await db.insert('scoresHistory', {'score': score});
  }

  Future<List<Score>> getScore() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db
        .rawQuery('SELECT * FROM scoresHistory ORDER BY id DESC LIMIT 3');
    return List.generate(maps.length, (i) {
      return Score.fromMap(maps[i]);
    });
  }
}

class QuizStatScreen extends StatefulWidget {
  const QuizStatScreen({super.key});

  @override
  QuizStatScreenState createState() => QuizStatScreenState();
}

class QuizStatScreenState extends State<QuizStatScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Score> _listScore = [];

  @override
  void initState() {
    super.initState();
    _databaseHelper.getScore().then((value) {
      setState(() {
        _listScore = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<QuizState>(
          builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'The Last Three Scores',
                  style: TextStyle(fontSize: 26, color: Colors.orange),
                ),
                Center(
                    child: Text(
                  _listScore.isNotEmpty
                      ? _listScore.map((e) => e.score.toString()).join(", ")
                      : 'No scores available',
                  style: TextStyle(fontSize: 26),
                )),
                Text(
                  'Your total score is: ${provider.totalScore}',
                  style: TextStyle(fontSize: 26, color: Colors.blue),
                ),
                SizedBox(
                  width: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    _databaseHelper.insertScore(provider.totalScore);
                    provider.resetScore();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: Text(
                    'Restart',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
