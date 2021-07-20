part of 'movie_bloc.dart';

@immutable
abstract class MovieState extends Equatable {}

class Loading extends MovieState {
  @override
  List<Object?> get props => [];
}

class MoviesFetched extends MovieState {
  final List<MovieModel> movies;

  MoviesFetched(
    this.movies,
  );

  @override
  List<Object?> get props => [movies];
}

class Error extends MovieState {
  final String message;

  Error(
    this.message,
  );

  @override
  List<Object?> get props => [message];
}
