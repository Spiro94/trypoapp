import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/tv_show.dart';
import '../repositories/show_repository.dart';

class SearchTvShows
    implements UseCase<Future<Either<Failure, List<TvShow>>>, Params> {
  final ShowRepository repository;

  SearchTvShows(this.repository);
  @override
  call(Params params) async {
    return await repository.searchTvShows(params.query);
  }
}
