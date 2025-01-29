import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news.dart';

class NewslistScreen extends StatefulWidget {
  const NewslistScreen({super.key});

  @override
  _NewslistScreenState createState() => _NewslistScreenState();
}

class _NewslistScreenState extends State<NewslistScreen> {
  List<News> news = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        news = data
            .map((newsItem) => News.fromJson(newsItem))
            .where((newsItem) => newsItem.id >= 1 && newsItem.id <= 100)
            .toList();
      });
    } else {
      throw Exception('Failed to load albums');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Albums'),
        centerTitle: true,
      ),
      body: news.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                final newsItem = news[index];
                return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '${newsItem.id}. ${newsItem.title}',
                      style: TextStyle(fontSize: 16),
                    ));
              },
            ),
    );
  }
}
