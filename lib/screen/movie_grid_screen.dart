import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/screen/movie_detail_screen.dart';
import 'package:movie_app/screen/search_screen.dart'; // Import Search Screen here

class MovieGridScreen extends ConsumerStatefulWidget {
  @override
  _MovieGridScreenState createState() => _MovieGridScreenState();
}

class _MovieGridScreenState extends ConsumerState<MovieGridScreen> {
  TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MovieGridScreen(), // Home Screen
    SearchScreen(), // Search Screen
  ];

  @override
  void initState() {
    super.initState();
    // Initial fetch of movies
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(movieProvider.notifier).fetchMovies();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(movieProvider);
    final movieNotifier = ref.read(movieProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Movies',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          // Custom Netflix-style search bar
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                cursorColor: Colors.white70,
                controller: _searchController,
                style: TextStyle(
                  color: Colors.white, // Set the entered text color here
                ),
                decoration: const InputDecoration(
                  hintText: 'Search for movies',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
                onChanged: (query) {
                  movieNotifier.searchMovies(query);
                },
              ),
            ),
          ),
          const SizedBox(height: 26),
          // Movie Grid
          Expanded(
            child: movies.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                      crossAxisSpacing: 8.0, // Space between columns
                      mainAxisSpacing: 8.0, // Space between rows
                      childAspectRatio:
                          0.7, // Adjust the aspect ratio to fit images
                    ),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      final imageUrl = movie.show?.image?.medium ?? '';
                      final title = movie.show?.name ?? 'No Title';

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailScreen(movie: movie),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: imageUrl.isNotEmpty
                                    ? Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        height: 230, // Adjust image height
                                        width: double.infinity,
                                      )
                                    : const Icon(Icons.movie, size: 180),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 42, 41, 41),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:
            Colors.white, // Sets the color of the selected label and icon
        unselectedItemColor: Colors
            .white70, // Optional: Sets the color of unselected labels and icons
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
