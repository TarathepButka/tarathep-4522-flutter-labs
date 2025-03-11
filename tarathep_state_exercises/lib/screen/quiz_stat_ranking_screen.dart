import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/score.dart';
import '../state/quiz_state.dart';

class ScoreRecord {
  final String? score;
  final String? timestamp;

  ScoreRecord({this.timestamp, this.score});
  @override
  String toString() {
    return 'Score: $score, Time: $timestamp';
  }
}

class RealtimeDatabase {
  final String baseUrl =
      "https://mobileappdev2025-dfc02-default-rtdb.asia-southeast1.firebasedatabase.app/scores.json";

  Future<void> sentPost(String totalScore) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body:
          json.encode({'time': DateTime.now().toString(), 'score': totalScore}),
    );
    debugPrint("Response is ${response.statusCode}");
  }

  Future<List<ScoreRecord>> fetchAndSortScores() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final List<ScoreRecord> scores = [];
      data.forEach((key, value) {
        scores.add(ScoreRecord(
          score: value['score'],
          timestamp: value['time'],
        ));
      });
      scores.sort((a, b) => int.parse(b.score!).compareTo(int.parse(a.score!)));
      debugPrint(scores.toString());
      return scores;
    }
    return [];
  }
}

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

class QuizStatRankScreen extends StatefulWidget {
  const QuizStatRankScreen({super.key});

  @override
  QuizStatScreenState createState() => QuizStatScreenState();
}

class QuizStatScreenState extends State<QuizStatRankScreen> {
  final RealtimeDatabase _database = RealtimeDatabase();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  List<Score> _listScore = [];
  List<ScoreRecord> _listrankScore = [];

  @override
  void initState() {
    super.initState();

    _database.fetchAndSortScores().then((value) {
      setState(() {
        _listrankScore = value;
      });
    });

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
                  'Ranking Scores',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange),
                ),
                SizedBox(height: 10),
                Column(
                  children: _listrankScore.isNotEmpty
                      ? _listrankScore
                          .map((e) => Text(
                                'Manee ${e.score}',
                                style: TextStyle(fontSize: 24),
                              ))
                          .toList()
                      : [
                          Text('No scores available',
                              style: TextStyle(fontSize: 24))
                        ],
                ),
                SizedBox(height: 20),
                Text(
                  'The Last Three Scores',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange),
                ),
                Text(
                  _listScore.isNotEmpty
                      ? _listScore.map((e) => e.score.toString()).join(", ")
                      : 'No scores available',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Text(
                  'Your total score is: ${provider.totalScore}',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _database.sentPost(provider.totalScore.toString());
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
