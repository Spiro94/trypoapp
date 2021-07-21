import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/movie_model.dart';
import '../../data/models/tv_show_model.dart';

abstract class ShowRepository {
  Future<Either<Failure, List<MovieModel>>> getSavedMovies();
  Future<Either<Failure, List<TvShowModel>>> getSavedTvShows();
  Future<Either<Failure, List<MovieModel>>> searchSavedMovies(String query);
  Future<Either<Failure, List<TvShowModel>>> searchSavedTvShows(String query);
  Future<Either<Failure, List<MovieModel>>> searchMovies(String query);
  Future<Either<Failure, List<TvShowModel>>> searchTvShows(String query);
}
