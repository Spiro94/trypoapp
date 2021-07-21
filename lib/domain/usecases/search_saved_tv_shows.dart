import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/tv_show_model.dart';
import '../repositories/show_repository.dart';

class SearchSavedTvShows
    implements UseCase<Future<Either<Failure, List<TvShowModel>>>, Params> {
  final ShowRepository repository;

  SearchSavedTvShows(this.repository);
  @override
  call(Params params) async {
    return await repository.searchSavedTvShows(params.query);
  }
}
