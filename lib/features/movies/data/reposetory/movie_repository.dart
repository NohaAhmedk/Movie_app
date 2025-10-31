import 'dart:developer';
import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/features/movies/data/datasources/movies_service.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';

class MovieRepo {
  final MovieApiService service;
  MovieRepo({required this.service});

  Future<ApiResult<List<MovieModel>>> getPopularMovies(int page) async {
    try {
      log('Fetching page $page ...');
      final response = await service.getPopularMovies('en-US', page);
      return ApiResult.success(response.results);
    } catch (error) {
      return ApiResult.error(error);
    }
  }
}
