import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/features/movies/data/datasources/movies_local_data_source.dart';
import 'package:movie_app/features/movies/data/reposetory/movie_repository.dart';
import '../../features/movies/data/datasources/movies_service.dart';
import '../networking/dio_factory.dart';
import '../../features/movies/data/models/movie_model.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());

  getIt.registerLazySingleton<Dio>(() => DioFactory().dio);

  getIt.registerLazySingleton<MovieApiService>(() => MovieApiService(getIt()));

  getIt.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSource());

  getIt.registerLazySingleton<MovieRepo>(() => MovieRepo(
    service: getIt(),
    localDataSource: getIt(),
  ));
}
