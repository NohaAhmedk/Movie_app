import 'package:hive/hive.dart';
import '../models/movie_model.dart';

class MovieLocalDataSource {
  static const String boxName = 'moviesBox';

  Future<void> cacheMovies(List<MovieModel> movies) async {
    final box = await Hive.openBox<MovieModel>(boxName);
    await box.clear();
    await box.addAll(movies);
  }

  Future<List<MovieModel>> getCachedMovies() async {
    final box = await Hive.openBox<MovieModel>(boxName);
    return box.values.toList();
  }

  Future<void> clearMovies() async {
    final box = await Hive.openBox<MovieModel>(boxName);
    await box.clear();
  }
}
