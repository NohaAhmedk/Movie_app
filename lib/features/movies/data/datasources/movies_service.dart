import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_constants.dart';
import 'package:movie_app/features/movies/data/models/movies_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class MovieApiService {
  factory MovieApiService(Dio dio, {String baseUrl}) = _MovieApiService;

  @GET('movie/popular')
  Future<MoviesResponse> getPopularMovies(
      @Query('language') String language,
      @Query('page') int page,
      );
}
