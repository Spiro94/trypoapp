import 'package:get_it/get_it.dart';
import '../presentation/bloc/show_bloc/movies_bloc.dart';
import '../presentation/bloc/show_bloc/tv_shows_bloc.dart';

import '../data/datasources/show_data_source.dart';
import '../data/repositories/show_repository_impl.dart';
import '../domain/repositories/show_repository.dart';
import '../domain/usecases/get_saved_movies.dart';
import '../domain/usecases/get_saved_tv_shows.dart';
import '../domain/usecases/search_saved_movies.dart';
import '../domain/usecases/search_saved_tv_shows.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerFactory(() => MoviesBloc(
        getSavedMovies: instance(),
        searchSavedMovies: instance(),
      ));
  instance.registerFactory(() => TvShowsBloc(
        getSavedTvShows: instance(),
        searchSavedTvShows: instance(),
      ));
  instance.registerLazySingleton(() => GetSavedMovies(instance()));
  instance.registerLazySingleton(() => GetSavedTvShows(instance()));
  instance.registerLazySingleton(() => SearchSavedMovies(instance()));
  instance.registerLazySingleton(() => SearchSavedTvShows(instance()));

  instance.registerLazySingleton<ShowRepository>(
      () => ShowRepositoryImpl(instance()));

  instance.registerLazySingleton<ShowDataSource>(() => ShowDataSourceImpl());
}
