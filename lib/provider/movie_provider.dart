import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie_model.dart';
import 'dart:convert';

final movieProvider = StateNotifierProvider<MovieNotifier, List<MovieModel>>((ref) => MovieNotifier());

class MovieNotifier extends StateNotifier<List<MovieModel>> {
  MovieNotifier() : super([]);

  Future<void> fetchMovies() async {
    try {
      final url = 'https://api.tvmaze.com/search/shows?q=all'; // Replace with your API URL
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        state = data.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }

  // Search movies by query from the API
  Future<void> searchMoviesByApi(String query) async {
    try {
      final url = 'https://api.tvmaze.com/search/shows?q=$query'; // Correct search endpoint URL
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        state = data.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search movies');
      }
    } catch (e) {
      print('Error searching movies: $e');
    }
  }

  // Filter the local movie list based on query
  void searchMovies(String query) {
    if (query.isEmpty) {
      fetchMovies(); // Fetch all movies if the query is empty
    } else {
      // Perform the API search when there's a query
      searchMoviesByApi(query);
    }
  }

  // void searchMovies(String query) {
  //   // Filter the movies based on the search query
  //   state = state.where((movie) {
  //     final name = movie.show?.name?.toLowerCase() ?? '';
  //     return name.contains(query.toLowerCase());
  //   }).toList();
  // }
}
