import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../core/domain/repositories/show_repository.dart';
import '../core/domain/usecases/get_saved_movies.dart';
import '../core/domain/usecases/get_saved_tv_shows.dart';
import '../core/domain/usecases/search_movies.dart';
import '../core/domain/usecases/search_saved_movies.dart';
import '../core/domain/usecases/search_saved_tv_shows.dart';
import '../core/domain/usecases/search_tv_shows.dart';
import '../features/search/data/datasources/show_data_source.dart';
import '../features/search/data/repositories/show_repository_impl.dart';
import '../features/search/presentation/bloc/movie_bloc/movie_bloc.dart';
import '../features/search/presentation/bloc/search_movie/search_movie_bloc.dart';
import '../features/search/presentation/bloc/tv_show_bloc/tv_show_bloc.dart';

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
