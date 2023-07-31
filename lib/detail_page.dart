import 'package:flutter/material.dart';
import 'package:submission_beginner/component/favorite_button.dart';
import 'package:submission_beginner/model/movie_list.dart';

class DetailPage extends StatelessWidget {
  final MovieList movie;
  final baseUrl = "https://image.tmdb.org/t/p/w500";

  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 16.0 : 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    baseUrl + movie.backdropPath,
                    height: isMobile ? 200.0 : 300.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: isMobile ? 16.0 : 32.0),
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: isMobile ? 24.0 : 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.date_range, color: Colors.blue),
                      const SizedBox(width: 4.0),
                      Text(movie.releaseDate),
                      const SizedBox(width: 10.0),
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 4.0),
                      Text('${movie.voteAverage}'),
                    ],
                  ),
                  SizedBox(height: isMobile ? 16.0 : 32.0),
                  Text(
                    movie.overview,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: isMobile ? 16.0 : 20.0),
                  ),
                  SizedBox(height: isMobile ? 16.0 : 32.0),
                  const FavoriteButton()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
