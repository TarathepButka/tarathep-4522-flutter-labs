import 'package:flutter/material.dart';
import '../models/article.dart';

class ResponsiveNewsFeedApp extends StatelessWidget {
  final List<Article> articles = [
    Article(
      title: 'Introduction to Flutter',
      description: 'Learn the basics of Flutter development...',
      date: '2024-01-05',
      readingTimeMinutes: 5,
    ),
    Article(
      title: 'Advanced Widget Patterns',
      description: 'Discover advanced patterns in Flutter...',
      date: '2024-01-04',
      readingTimeMinutes: 8,
    ),
  ];
  ResponsiveNewsFeedApp({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Feed"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return Card(
              child: ListTile(
                  title: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 4),
                      child: Text(
                        article.title,
                        style: TextStyle(
                          fontSize: isPortrait ? 18 : 20,
                          fontWeight: FontWeight.bold,
                          color: isPortrait ? Colors.blue : Colors.green,
                        ),
                      )),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                article.description,
                                style: TextStyle(
                                  fontSize: isPortrait ? 14 : 18,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                article.date,
                                style: TextStyle(
                                  fontSize: isPortrait ? 14 : 18,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                '${article.readingTimeMinutes} min read',
                                style: TextStyle(
                                  fontSize: isPortrait ? 12 : 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ]),
                  )),
            );
          },
        ),
      ),
    );
  }
}
