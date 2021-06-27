import 'package:dartz/dartz.dart';
import '../../data/models/movie_model.dart';
import '../../data/models/tv_show_model.dart';

import '../../../../core/error/failure.dart';

abstract class ShowRepository {
  Future<Either<Failure, List<MovieModel>>> getSavedMovies();
  Future<Either<Failure, List<TvShowModel>>> getSavedTvShows();
}
