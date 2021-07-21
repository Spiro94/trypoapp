import 'package:dartz/dartz.dart';
import 'package:trypoapp/features/search/data/models/movie_model.dart';
import 'package:trypoapp/features/search/data/models/tv_show_model.dart';

import '../../../../core/error/failure.dart';

abstract class ShowRepository {
  Future<Either<Failure, List<MovieModel>>> getSavedMovies();
  Future<Either<Failure, List<TvShowModel>>> getSavedTvShows();
  Future<Either<Failure, List<MovieModel>>> searchSavedMovies(String query);
  Future<Either<Failure, List<TvShowModel>>> searchSavedTvShows(String query);
  Future<Either<Failure, List<MovieModel>>> searchMovies(String query);
  Future<Either<Failure, List<TvShowModel>>> searchTvShows(String query);
}
