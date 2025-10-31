import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/data/reposetory/movie_repository.dart';
import 'movies_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepo repo;
  int currentPage = 1;
  bool isLoadingMore = false;
  bool hasMore = true;
  List movies = [];

  MovieCubit(this.repo) : super(MovieInitial());

  Future<void> fetchPopularMovies({bool isFirstLoad = true}) async {
    if (isLoadingMore || !hasMore) return;

    if (isFirstLoad) emit(MovieLoading());
    isLoadingMore = true;

    final result = await repo.getPopularMovies(currentPage);

    result.when(
      onSuccess: (newMovies) {
        if (newMovies.isEmpty) {
          hasMore = false;
        } else {
          movies.addAll(newMovies);
          currentPage++;
        }
        emit(MovieLoaded(List.from(movies)));
      },
      onError: (error) {
        emit(MovieError(error.message ?? 'Something went wrong'));
      },
    );

    isLoadingMore = false;
  }
}
