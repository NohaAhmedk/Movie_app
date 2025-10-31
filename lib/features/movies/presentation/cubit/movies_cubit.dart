import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/movie_model.dart';
import '../../data/reposetory/movie_repository.dart';
import 'movies_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepo repo;

  int page = 1;
  bool loading = false;
  List<MovieModel> movies = [];

  MovieCubit({required this.repo}) : super(MovieInitial());

  // Load movies
  Future<void> fetchMovies() async {
    if (loading) return; // Don't fetch if already loading

    // Show loading only if list is empty
    if (movies.isEmpty) {
      emit(MovieLoading());
    } else {
      emit(MovieLoaded(List.from(movies)));
    }

    loading = true;

    final result = await repo.getPopularMovies(page);

    result.when(
      onSuccess: (newMovies) {
        // Keep only movies not already in the list
        List<MovieModel> newOnly = [];
        for (var movie in newMovies) {
          bool exists = false;
          for (var old in movies) {
            if (old.title == movie.title) {
              exists = true;
              break;
            }
          }
          if (!exists) {
            newOnly.add(movie);
          }
        }

        // Add new movies and increase page
        if (newOnly.isNotEmpty) {
          movies.addAll(newOnly);
          page = page + 1;
        }

        emit(MovieLoaded(List.from(movies)));
      },
      onError: (err) {
        if (movies.isNotEmpty) {
          // Show existing movies even if error
          emit(MovieLoaded(List.from(movies)));
        } else {
          // Show error if no movies
          emit(MovieError(
              err.message != null ? err.message! : 'Something went wrong'));
        }
      },
    );

    loading = false;
  }

  // Reset the cubit
  void reset() {
    page = 1;
    movies.clear();
    emit(MovieInitial());
  }
}
