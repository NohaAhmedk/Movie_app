import 'package:hive/hive.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final double voteAverage;

  @HiveField(2)
  final String overview;

  @HiveField(3)
  final String posterPath;

  @HiveField(4)
  final List<int> genreIds;

  @HiveField(5)
  final String original_language;

  MovieModel({
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.posterPath,
    required this.genreIds,
    required this.original_language,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      original_language: json['original_language'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'vote_average': voteAverage,
    'overview': overview,
    'poster_path': posterPath,
    'genre_ids': genreIds,
    'original_language': original_language,
  };
}
