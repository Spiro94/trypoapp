part of 'movies_bloc.dart';

@immutable
abstract class ShowEvent {}

class GetSavedMoviesEvent extends ShowEvent {}

class GetSavedTvShowsEvent extends ShowEvent {}

class SearchSavedMoviesEvent extends ShowEvent {
  final String query;

  SearchSavedMoviesEvent(
    this.query,
  );
}

class SearchSavedTvShowsEvent extends ShowEvent {
  final String query;

  SearchSavedTvShowsEvent(
    this.query,
  );
}
