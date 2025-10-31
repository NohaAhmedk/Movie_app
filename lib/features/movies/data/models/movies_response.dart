import 'movie_model.dart';

class MoviesResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
      page: json['page'] ?? 0,
      results: (json['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }
}
