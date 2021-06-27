import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/tv_show_model.dart';
import '../repositories/show_repository.dart';

class GetSavedTvShows
    implements UseCase<Future<Either<Failure, List<TvShowModel>>>> {
  final ShowRepository repository;

  GetSavedTvShows(this.repository);
  @override
  call() async {
    return await repository.getSavedTvShows();
  }
}
