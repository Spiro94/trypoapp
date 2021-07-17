import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/show_repository.dart';
import '../datasources/show_data_source.dart';
import '../models/movie_model.dart';
import '../models/tv_show_model.dart';

class ShowRepositoryImpl implements ShowRepository {
  final ShowDataSource dataSource;

  ShowRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<MovieModel>>> getSavedMovies() async {
    try {
      return Right(await dataSource.getSavedMovies());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TvShowModel>>> getSavedTvShows() async {
    try {
      return Right(await dataSource.getSavedTvShows());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> searchSavedMovies(
      String query) async {
    try {
      return Right(await dataSource.searchSavedMovies(query));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TvShowModel>>> searchSavedTvShows(
      String query) async {
    try {
      return Right(await dataSource.searchSavedTvShows(query));
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
