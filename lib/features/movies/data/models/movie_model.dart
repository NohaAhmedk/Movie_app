class MovieModel {
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;
  final List<int> genreIds;
  final String original_language;


  MovieModel({
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.posterPath,
    required this.genreIds,
    required this.original_language ,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      original_language: json['original_language'] ?? '',
    );
  }
}
