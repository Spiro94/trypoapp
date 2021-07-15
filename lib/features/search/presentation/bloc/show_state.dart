part of 'show_bloc.dart';

@immutable
abstract class ShowState {}

class Initial extends ShowState {}

class Loading extends ShowState {}

class Error extends ShowState {
  final String message;

  Error(this.message);
}

class MoviesFetched extends ShowState {
  final List<MovieModel> movies;

  MoviesFetched(this.movies);
}
