import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movies/data/reposetory/movie_repository.dart';

import '../../features/movies/data/datasources/movies_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;
void setupDependencies() {
  getIt.registerLazySingleton<Dio>(() => DioFactory().dio);
  getIt.registerLazySingleton<MovieApiService>(() => MovieApiService(getIt()));
  getIt.registerLazySingleton<MovieRepo>(() => MovieRepo(service: getIt()));
}
