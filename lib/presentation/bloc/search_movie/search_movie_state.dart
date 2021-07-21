part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();
}

class InitialState extends SearchMovieState {
  @override
  List<Object?> get props => [];
}

class Loading extends SearchMovieState {
  @override
  List<Object?> get props => [];
}

class MoviesFetched extends SearchMovieState {
  final List<Movie> movies;

  const MoviesFetched(
    this.movies,
  );

  @override
  List<Object?> get props => [movies];
}

class TvShowsFetched extends SearchMovieState {
  final List<TvShow> tvShows;

  const TvShowsFetched(
    this.tvShows,
  );

  @override
  List<Object?> get props => [tvShows];
}

class Error extends SearchMovieState {
  final String message;

  const Error(
    this.message,
  );

  @override
  List<Object?> get props => [message];
}
