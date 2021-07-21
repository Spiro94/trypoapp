part of 'search_movie_bloc.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();

  @override
  List<Object> get props => [];
}

class MovieSearchEvent extends SearchMovieEvent {
  final String query;

  MovieSearchEvent(
    this.query,
  );
}

class TvShowSearchEvent extends SearchMovieEvent {
  final String query;

  TvShowSearchEvent(
    this.query,
  );
}

class Clear extends SearchMovieEvent {}
