import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/di.dart';
import '../cubit/movies_cubit.dart';
import '../cubit/movies_state.dart';
import '../widgets/movie_card.dart';
import '../widgets/movies_app_bar.dart';
import '../../data/reposetory/movie_repository.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MovieCubit cubit;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    cubit = MovieCubit(repo: getIt<MovieRepo>())..fetchMovies();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!scrollController.hasClients || cubit.loading) return;

    final maxScroll = scrollController.position.maxScrollExtent;
    final current = scrollController.position.pixels;

    if (current >= 0.75 * maxScroll) {
      cubit.fetchMovies();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: const MoviesAppBar(),
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            // Show loading when first load
            if (state is MovieLoading && cubit.movies.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            // Show empty state if no movies
            if (cubit.movies.isEmpty) {
              return const Center(child: Text('No movies found'));
            }

            // Show movies list
            return ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: cubit.movies.length + 1, // extra item for loading
              itemBuilder: (context, index) {
                if (index < cubit.movies.length) {
                  return MovieCard(movie: cubit.movies[index]);
                } else {
                  // Show loading at the end when fetching more
                  return cubit.loading
                      ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  )
                      : const SizedBox.shrink();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
