import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/movie.dart';
import '../../../../../core/domain/entities/tv_show.dart';
import '../../../../../core/domain/usecases/search_movies.dart';
import '../../../../../core/domain/usecases/search_tv_shows.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;
  final SearchTvShows searchTvshows;
  SearchMovieBloc({
    required this.searchMovies,
    required this.searchTvshows,
  }) : super(InitialState());

  @override
  Stream<SearchMovieState> mapEventToState(
    SearchMovieEvent event,
  ) async* {
    if (event is MovieSearchEvent) {
      yield Loading();
      if (event.query.isEmpty) {
        yield InitialState();
      } else {
        final result = await searchMovies.call(Params(event.query));
        yield* _eitherSuccessOrErrorStateMovie(result);
      }
    } else if (event is TvShowSearchEvent) {
      yield Loading();
      if (event.query.isEmpty) {
        yield InitialState();
      } else {
        final result = await searchTvshows.call(Params(event.query));
        yield* _eitherSuccessOrErrorStateTvShow(result);
      }
    } else if (event is Clear) {
      yield InitialState();
    }
  }

  Stream<SearchMovieState> _eitherSuccessOrErrorStateMovie(
      Either<Failure, List<Movie>> result) async* {
    yield result.fold(
      (error) => Error('Error obtaining data'),
      (movies) => MoviesFetched(movies),
    );
  }

  Stream<SearchMovieState> _eitherSuccessOrErrorStateTvShow(
      Either<Failure, List<TvShow>> result) async* {
    yield result.fold(
      (error) => Error('Error obtaining data'),
      (tvShows) => TvShowsFetched(tvShows),
    );
  }
}
