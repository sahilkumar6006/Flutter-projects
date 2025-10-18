import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import '../data/movie_data.dart';
import '../widget/movie_card.dart';
import 'movie_details_screen.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List<Movie> movies = [];
  List<Movie> filteredMovies = [];
  String selectedGenre = 'All';
  bool isLoading = true;

  final List<String> genres = [
    'All',
    'Action',
    'Adventure',
    'Sci-Fi',
    'Drama',
    'Crime',
  ];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() {
    setState(() {
      isLoading = true;
    });

    // Simulate loading delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        movies = MovieData.getMovies();
        filteredMovies = movies;
        isLoading = false;
      });
    });
  }

  void _filterMovies(String genre) {
    setState(() {
      selectedGenre = genre;
      if (genre == 'All') {
        filteredMovies = movies;
      } else {
        filteredMovies = movies
            .where(
              (movie) =>
                  movie.genre.toLowerCase().contains(genre.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Movie Booking App'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // Navigate to booking history
              Navigator.pushNamed(context, '/bookings');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Genre Filter Chips
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: genres.length,
              itemBuilder: (context, index) {
                final genre = genres[index];
                final isSelected = selectedGenre == genre;
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(genre),
                    selected: isSelected,
                    onSelected: (selected) => _filterMovies(genre),
                    backgroundColor: Colors.white,
                    selectedColor: Colors.deepPurple.withOpacity(0.2),
                    checkmarkColor: Colors.deepPurple,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.deepPurple : Colors.grey[700],
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),

          // Movies List
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.deepPurple),
                  )
                : filteredMovies.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.movie_filter, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'No movies found',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredMovies.length,
                    itemBuilder: (context, index) {
                      final movie = filteredMovies[index];
                      return MovieCard(
                        movie: movie,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailsScreen(movie: movie),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
