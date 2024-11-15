// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movie_app/model/movie_model.dart';
// import 'package:movie_app/services/movie_service.dart'; // Add your service to make the API call

// // Define a provider for movies
// final movieProvider = StateNotifierProvider<MovieNotifier, List<MovieModel>>((ref) {
//   return MovieNotifier();
// });

// class MovieNotifier extends StateNotifier<List<MovieModel>> {
//   MovieNotifier() : super([]);

//   // Fetch movies from API
//   Future<void> fetchMovies() async {
//     final movies = await MovieModel.fetchMovies();
//     state = movies;
//   }

//   // Search movies based on the query
//   Future<void> searchMovies(String query) async {
//     if (query.isEmpty) {
//       fetchMovies(); // Fetch all movies if the search query is empty
//     } else {
//       final movies = await MovieService.searchMovies(query); // Use the search endpoint
//       state = movies;
//     }
//   }
// }
