import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/movie_model.dart';
import '../repositories/show_repository.dart';

class GetSavedMovies
    implements UseCase<Future<Either<Failure, List<MovieModel>>>, NoParams> {
  final ShowRepository repository;

  GetSavedMovies(this.repository);
  @override
  call(NoParams noParams) async {
    return await repository.getSavedMovies();
  }
}
