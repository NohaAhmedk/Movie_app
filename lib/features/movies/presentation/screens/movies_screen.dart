import 'package:flutter/material.dart';
import '../../data/models/movie_model.dart';
import '../widgets/movie_card.dart';
import '../widgets/movies_app_bar.dart';

class MoviesScreen extends StatelessWidget {
  MoviesScreen({super.key});

  final List<MovieModel> movies = [
    MovieModel(
      title: "The Matrix",
      rating: 8.7,
      genre: "Sci-Fi",
      description:
      "A computer programmer discovers that reality as he knows it is a simulation created by machines.",
    ),
    MovieModel(
      title: "Fight Club",
      rating: 8.8,
      genre: "Drama",
      description:
      "An insomniac office worker and a soap maker form an underground fight club.",
    ),
    MovieModel(
      title: "Forrest Gump",
      rating: 8.8,
      genre: "Drama",
      description:
      "The presidencies of Kennedy and Johnson, Vietnam, and other events unfold through the perspective of an Alabama man.",
    ),
    MovieModel(
      title: "The Shawshank Redemption",
      rating: 9.3,
      genre: "Drama",
      description:
      "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
    ),
    MovieModel(
      title: "The Godfather",
      rating: 9.2,
      genre: "Crime",
      description:
      "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MoviesAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => MovieCard(movie: movies[index]),
        ),
      ),
    );
  }
}
