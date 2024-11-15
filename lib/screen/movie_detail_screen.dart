import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart' as model;

class MovieDetailScreen extends StatelessWidget {
  final model.MovieModel movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    final show = movie.show;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        title: Text(
          show?.name ?? 'No Title',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Handle adding movie to favorites (optional)
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Handle sharing movie (optional)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Movie Poster
              if (show?.image?.original != null)
                Center(
                  child: Image.network(
                    show!.image!.original!,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                )
              else
                Center(
                  child: Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              const SizedBox(height: 16),

              // Movie Title
              Text(
                show?.name ?? 'No Title',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              // Movie Description (Short Summary)
              Text(
                show?.summary ?? 'No Description available.',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),

              // Genre and Release Date (optional)
              Row(
                children: [
                  Text(
                    'Genre: ${show?.genres?.join(", ") ?? 'Unknown'}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Release Date: ${show?.premiered ?? 'Unknown'}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Play Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    
                    //primary: Colors.red, // Netflix red
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Handle the play button (e.g., open video player)
                  },
                  child: const Text(
                    'Play',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
