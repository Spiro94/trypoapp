import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/tv_show.dart';
import '../repositories/show_repository.dart';

class GetSavedTvShows
    implements UseCase<Future<Either<Failure, List<TvShow>>>, NoParams> {
  final ShowRepository repository;

  GetSavedTvShows(this.repository);
  @override
  call(NoParams noParams) async {
    return await repository.getSavedTvShows();
  }
}
