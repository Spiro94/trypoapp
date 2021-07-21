import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/movie_model.dart';
import '../repositories/show_repository.dart';

class SearchMovies
    implements UseCase<Future<Either<Failure, List<MovieModel>>>, Params> {
  final ShowRepository repository;

  SearchMovies(this.repository);
  @override
  call(Params params) async {
    return await repository.searchMovies(params.query);
  }
}
