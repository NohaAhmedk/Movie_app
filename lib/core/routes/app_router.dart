import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/movies/presentation/screens/movies_screen.dart';
import '../../features/movies/presentation/screens/movie_details_screen.dart';
import '../../features/movies/data/models/movie_model.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'MoviesScreen',
        builder: (context, state) => MoviesScreen(),
      ),

      GoRoute(
        path: '/MovieDetailsScreen',
        name: 'MovieDetailsScreen',
        builder: (context, state) {
          final movie = state.extra as MovieModel;
          return MovieDetailsScreen(movie: movie);
        },
      ),
    ],
  );
}
