import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/provider/movie_provider.dart';

class SearchScreen extends ConsumerWidget {

    TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
        final movieNotifier = ref.read(movieProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
      ),
      body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                cursorColor: Colors.white70,
                controller: _searchController,
                style: const TextStyle(
                color: Colors.white, // Set the entered text color here
                ),        
                decoration: const InputDecoration(
                  hintText: 'Search for movies',
                  hintStyle: TextStyle(color: Colors.white70),
                  
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
                onChanged: (query) {
                  movieNotifier.searchMovies(query);
                },
              ),
            ),
          ),
    );
  }
}
