import 'package:get_it/get_it.dart';
import '../features/search/domain/usecases/search_saved_movies.dart';
import '../features/search/domain/usecases/search_saved_tv_shows.dart';

import '../features/search/data/datasources/show_data_source.dart';
import '../features/search/data/repositories/show_repository_impl.dart';
import '../features/search/domain/repositories/show_repository.dart';
import '../features/search/domain/usecases/get_saved_movies.dart';
import '../features/search/domain/usecases/get_saved_tv_shows.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerLazySingleton(() => GetSavedMovies(instance()));
  instance.registerLazySingleton(() => GetSavedTvShows(instance()));
  instance.registerLazySingleton(() => SearchSavedMovies(instance()));
  instance.registerLazySingleton(() => SearchSavedTvShows(instance()));

  instance.registerLazySingleton<ShowRepository>(
      () => ShowRepositoryImpl(instance()));

  instance.registerLazySingleton<ShowDataSource>(() => ShowDataSourceImpl());
}
