import 'package:flutter/material.dart';
import 'models/movie.dart';

void main() => runApp(const MaterialApp(
      home: MovieListApp(),
      debugShowCheckedModeBanner: false,
    ));

class MovieListApp extends StatelessWidget {
  const MovieListApp({super.key});

  void _handleMovieTap(BuildContext context, Movie movie) {
    String message;

    if (movie.rating > 8.0) {
      message = "This is a highly rated movie!";
    } else if (movie.rating >= 6.0 && movie.rating <= 8.0) {
      message = "This is a good movie";
    } else {
      message = "This movie might need improvement";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
            label: "Dismiss",
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies = [
      const Movie(
        title: "The Shawshank Redemption",
        year: 1994,
        genre: "Drama",
        director: "Frank Darabont",
        rating: 9.3,
      ),
      const Movie(
        title: "Inception",
        year: 2010,
        genre: "Sci-Fi",
        director: "Christopher Nolan",
        rating: 7.8,
      ),
      const Movie(
        title: "Disaster Movie",
        year: 2008,
        genre: "Comedy",
        director: "Jason Friedberg",
        rating: 1.9,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List App'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: movies
            .map((movie) => ListTile(
                  leading: const Icon(
                    Icons.movie,
                    color: Colors.grey,
                  ),
                  title: Text(movie.title),
                  subtitle: Text(
                    '${movie.year} • ${movie.genre}\nDirector: ${movie.director}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.rating.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onTap: () => _handleMovieTap(context, movie),
                ))
            .toList(),
      ),
    );
  }
}
