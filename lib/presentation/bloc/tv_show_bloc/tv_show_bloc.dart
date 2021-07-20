import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/models/tv_show_model.dart';
import '../../../domain/usecases/get_saved_tv_shows.dart';
import '../../../domain/usecases/search_saved_tv_shows.dart';

part 'tv_show_event.dart';
part 'tv_show_state.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {
  final GetSavedTvShows getSavedTvShows;
  final SearchSavedTvShows searchSavedTvShows;

  TvShowBloc({
    required this.getSavedTvShows,
    required this.searchSavedTvShows,
  }) : super(Loading());

  @override
  Stream<TvShowState> mapEventToState(
    TvShowEvent event,
  ) async* {
    if (event is GetSavedTvShowsEvent) {
      yield Loading();
      final result = await getSavedTvShows.call(NoParams());

      yield* _eitherSuccessOrErrorState(result);
    } else if (event is SearchSavedTvShowsEvent) {
      yield Loading();
      final result = await searchSavedTvShows.call(Params(event.query));
      yield* _eitherSuccessOrErrorState(result);
    }
  }

  Stream<TvShowState> _eitherSuccessOrErrorState(
      Either<Failure, List<TvShowModel>> result) async* {
    yield result.fold(
      (error) => Error('Error obtaining data'),
      (tvShows) => TvShowsFetched(tvShows),
    );
  }
}
