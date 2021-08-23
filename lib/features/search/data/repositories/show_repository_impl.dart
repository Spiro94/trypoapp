import 'package:dartz/dartz.dart';
import 'package:trypoapp/core/error/exceptions.dart';

import '../../../../core/domain/repositories/show_repository.dart';
import '../../../../core/error/failure.dart';
import '../datasources/show_data_source.dart';
import '../models/movie_model.dart';
import '../models/tv_show_model.dart';

class ShowRepositoryImpl implements ShowRepository {
  final ShowDataSource dataSource;

  ShowRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<MovieModel>>> getSavedMovies() async {
    //? Another way to implement the return for Either statement
    // return await Task(() => dataSource.getSavedMovies())
    //     .attempt()
    //     .map((either) => either.leftMap((l) => l as Failure))
    //     .run();
    try {
      return Right(await dataSource.getSavedMovies());
    } on BaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<TvShowModel>>> getSavedTvShows() async {
    try {
      return Right(await dataSource.getSavedTvShows());
    } on BaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> searchSavedMovies(
      String query) async {
    try {
      return Right(await dataSource.searchSavedMovies(query));
    } on BaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<TvShowModel>>> searchSavedTvShows(
      String query) async {
    try {
      return Right(await dataSource.searchSavedTvShows(query));
    } on BaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> searchMovies(String query) async {
    try {
      return Right(await dataSource.searchMovies(query));
    } on BaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<TvShowModel>>> searchTvShows(String query) async {
    try {
      return Right(await dataSource.searchTvShows(query));
    } on BaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
