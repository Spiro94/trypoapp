import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/models/tv_show_model.dart';
import '../../../domain/usecases/get_saved_movies.dart';
import '../../../domain/usecases/search_saved_movies.dart';

part 'show_event.dart';
part 'show_state.dart';

class MoviesBloc extends Bloc<ShowEvent, ShowState> {
  final GetSavedMovies getSavedMovies;
  final SearchSavedMovies searchSavedMovies;

  MoviesBloc({
    required this.getSavedMovies,
    required this.searchSavedMovies,
  }) : super(MoviesFetched([]));

  @override
  Stream<ShowState> mapEventToState(
    ShowEvent event,
  ) async* {
    if (event is GetSavedMoviesEvent) {
      yield Loading();
      final result = await getSavedMovies.call(NoParams());

      yield* _eitherSuccessOrErrorState(result);
    } else if (event is SearchSavedMoviesEvent) {
      yield Loading();
      final result = await searchSavedMovies.call(Params(event.query));
      yield* _eitherSuccessOrErrorState(result);
    }
  }

  Stream<ShowState> _eitherSuccessOrErrorState(
      Either<Failure, List<MovieModel>> result) async* {
    yield result.fold(
      (error) => Error('Error obtaining data'),
      (movies) => MoviesFetched(movies),
    );
  }
}
