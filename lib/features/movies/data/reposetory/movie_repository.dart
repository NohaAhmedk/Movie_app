import 'dart:developer';

import 'package:movie_app/core/networking/api_result.dart';
import '../datasources/movies_local_data_source.dart';
import '../datasources/movies_service.dart';
import '../models/movie_model.dart';

class MovieRepo {
  final MovieApiService service;
  final MovieLocalDataSource localDataSource;

  MovieRepo({required this.service, required this.localDataSource});

  Future<ApiResult<List<MovieModel>>> getPopularMovies(int page) async {
    try {
      final response = await service.getPopularMovies('en-US', page);
      final cachedMovies = await localDataSource.getCachedMovies();
      log('cachedMovies: $cachedMovies');
      List<MovieModel> moviesToCache = [];
      if (page == 1) {
        log('clearing cache');
        moviesToCache = response.results;
        log('clearing cache done');
      } else {
        log('adding new movies');
        moviesToCache = List.from(cachedMovies);
        for (var movie in response.results) {
          if (!cachedMovies.any((m) => m.title == movie.title)) {
            moviesToCache.add(movie);
          }
        }
      }

      // 3. Save to cache
      await localDataSource.cacheMovies(moviesToCache);

      return ApiResult.success(response.results);
    } catch (e) {
      // On error, return cached movies if any
      final cachedMovies = await localDataSource.getCachedMovies();
      if (cachedMovies.isNotEmpty) return ApiResult.success(cachedMovies);
      return ApiResult.error(e);
    }
  }
}
