import 'package:flutter/material.dart';
import 'package:submission_beginner/detail_page.dart';
import 'package:submission_beginner/model/movie_list.dart';

class MainPage extends StatelessWidget {
  final String name;
  const MainPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Hello, $name \nWhat movie you want to watch today?",
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
            )
        ),
        automaticallyImplyLeading: false, // Disable back navigation
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          return ListView.builder(
            itemCount: moviePlayList.length,
            itemBuilder: (context, index) {
              final movie = moviePlayList[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(movie: movie),
                    ),
                  );
                },
                child: MovieCard(
                  movie: movie,
                  isMobile: isMobile,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final MovieList movie;
  final bool isMobile;

  const MovieCard({super.key, required this.movie, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 16.0 : 32.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            baseUrl + movie.posterPath,
            width: isMobile ? 100.0 : 150.0,
            height: isMobile ? 100.0 : 150.0,
            fit: BoxFit.cover,
          ),
          SizedBox(width: isMobile ? 10.0 : 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.originalTitle,
                  style: TextStyle(
                    fontSize: isMobile ? 18.0 : 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children : [
                    const Icon(Icons.star, color: Colors.yellow),
                    const SizedBox(width: 4.0),
                    Text('${movie.voteAverage}'),
                  ]
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}