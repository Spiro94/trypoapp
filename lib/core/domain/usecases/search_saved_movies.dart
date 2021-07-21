import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repositories/show_repository.dart';

class SearchSavedMovies
    implements UseCase<Future<Either<Failure, List<Movie>>>, Params> {
  final ShowRepository repository;

  SearchSavedMovies(this.repository);
  @override
  call(Params params) async {
    return await repository.searchSavedMovies(params.query);
  }
}
