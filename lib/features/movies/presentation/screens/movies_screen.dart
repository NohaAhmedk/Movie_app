import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/features/movies/data/reposetory/movie_repository.dart';
import 'package:movie_app/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:movie_app/features/movies/presentation/cubit/movies_state.dart';
import '../widgets/movie_card.dart';
import '../widgets/movies_app_bar.dart';
class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final ScrollController _scrollController = ScrollController();

  late MovieCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = MovieCubit(getIt<MovieRepo>())..fetchPopularMovies();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients || _cubit.isLoadingMore || !_cubit.hasMore) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= 0.75 * maxScroll) {
      _cubit.fetchPopularMovies(isFirstLoad: false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: const MoviesAppBar(),
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading && _cubit.movies.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else if (_cubit.movies.isNotEmpty) {
              return ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(12),
                itemCount: _cubit.hasMore ? _cubit.movies.length + 1 : _cubit.movies.length,
                itemBuilder: (context, index) {
                  if (index < _cubit.movies.length) {
                    final movie = _cubit.movies[index];
                    return MovieCard(movie: movie);
                  } else {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: _AnimatedLoadingBar(),
                    );
                  }
                },
              );
            } else if (state is MovieError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _AnimatedLoadingBar extends StatefulWidget {
  const _AnimatedLoadingBar();

  @override
  State<_AnimatedLoadingBar> createState() => _AnimatedLoadingBarState();
}

class _AnimatedLoadingBarState extends State<_AnimatedLoadingBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return SizedBox(
      height: 6,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 1,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Transform.translate(
                  offset: Offset(MediaQuery.of(context).size.width * _controller.value, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          color.withValues(alpha: 0.9),
                          color.withValues(alpha: 0.3),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
