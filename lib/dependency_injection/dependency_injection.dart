import 'package:get_it/get_it.dart';
import '../domain/usecases/search_movies.dart';
import '../domain/usecases/search_tv_shows.dart';
import '../presentation/bloc/search_movie/search_movie_bloc.dart';

import '../data/datasources/show_data_source.dart';
import '../data/repositories/show_repository_impl.dart';
import '../domain/repositories/show_repository.dart';
import '../domain/usecases/get_saved_movies.dart';
import '../domain/usecases/get_saved_tv_shows.dart';
import '../domain/usecases/search_saved_movies.dart';
import '../domain/usecases/search_saved_tv_shows.dart';
import '../presentation/bloc/movie_bloc/movie_bloc.dart';
import '../presentation/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'package:http/http.dart' as http;

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerFactory(() => MovieBloc(
        getSavedMovies: instance(),
        searchSavedMovies: instance(),
      ));
  instance.registerFactory(() => TvShowBloc(
        getSavedTvShows: instance(),
        searchSavedTvShows: instance(),
      ));
  instance.registerFactory(() => SearchMovieBloc(
        searchMovies: instance(),
        searchTvshows: instance(),
      ));
  instance.registerLazySingleton(() => GetSavedMovies(instance()));
  instance.registerLazySingleton(() => GetSavedTvShows(instance()));
  instance.registerLazySingleton(() => SearchSavedMovies(instance()));
  instance.registerLazySingleton(() => SearchSavedTvShows(instance()));
  instance.registerLazySingleton(() => SearchMovies(instance()));
  instance.registerLazySingleton(() => SearchTvShows(instance()));

  instance.registerLazySingleton<ShowRepository>(
      () => ShowRepositoryImpl(instance()));

  instance.registerLazySingleton<ShowDataSource>(
      () => ShowDataSourceImpl(instance()));

  instance.registerLazySingleton(() => http.Client());
}
