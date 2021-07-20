part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class GetSavedMoviesEvent extends MovieEvent {}

class SearchSavedMoviesEvent extends MovieEvent {
  final String query;

  SearchSavedMoviesEvent(
    this.query,
  );
}
