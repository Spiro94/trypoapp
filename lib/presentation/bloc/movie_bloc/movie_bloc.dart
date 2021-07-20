import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/movie_model.dart';
import '../../../domain/usecases/get_saved_movies.dart';
import '../../../domain/usecases/search_saved_movies.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetSavedMovies getSavedMovies;
  final SearchSavedMovies searchSavedMovies;

  MovieBloc({
    required this.getSavedMovies,
    required this.searchSavedMovies,
  }) : super(MoviesFetched([]));

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
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

  Stream<MovieState> _eitherSuccessOrErrorState(
      Either<Failure, List<MovieModel>> result) async* {
    yield result.fold(
      (error) => Error('Error obtaining data'),
      (movies) => MoviesFetched(movies),
    );
  }
}
