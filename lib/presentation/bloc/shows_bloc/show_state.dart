part of 'movies_bloc.dart';

@immutable
abstract class ShowState extends Equatable {}

class Loading extends ShowState {
  @override
  List<Object?> get props => [];
}

class MoviesFetched extends ShowState {
  final List<MovieModel> movies;

  MoviesFetched(
    this.movies,
  );

  @override
  List<Object?> get props => [movies];
}

class ShowsFetched extends ShowState {
  final List<MovieModel>? movies;
  final List<TvShowModel>? tvShows;

  ShowsFetched({
    this.movies,
    this.tvShows,
  });

  @override
  List<Object?> get props => [
        movies,
        tvShows,
      ];
}

class TvShowsFetched extends ShowState {
  final List<TvShowModel> tvShows;

  TvShowsFetched(
    this.tvShows,
  );

  @override
  List<Object?> get props => [tvShows];
}

class Error extends ShowState {
  final String message;

  Error(
    this.message,
  );

  @override
  List<Object?> get props => [message];
}
