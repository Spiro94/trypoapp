import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/movie_model.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_saved_movies.dart';
import '../../domain/usecases/get_saved_tv_shows.dart';

part 'show_event.dart';
part 'show_state.dart';

class ShowBloc extends Bloc<ShowEvent, ShowState> {
  final GetSavedMovies getSavedMovies;
  final GetSavedTvShows getSavedTvShows;

  ShowBloc({
    required this.getSavedMovies,
    required this.getSavedTvShows,
  }) : super(Initial());

  @override
  Stream<ShowState> mapEventToState(
    ShowEvent event,
  ) async* {
    if (event is GetSavedMoviesEvent) {
      yield Loading();
      final result = await getSavedMovies.call(NoParams());

      yield result.fold((error) => Error('Error obtaining data'),
          (movies) => MoviesFetched(movies));
    } else if (event is GetSavedTvShowsEvent) {
      yield Loading();
    }
  }
}
