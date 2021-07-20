part of 'tv_show_bloc.dart';

@immutable
abstract class TvShowState extends Equatable {}

class Loading extends TvShowState {
  @override
  List<Object?> get props => [];
}

class TvShowsFetched extends TvShowState {
  final List<TvShowModel> tvShows;

  TvShowsFetched(
    this.tvShows,
  );

  @override
  List<Object?> get props => [tvShows];
}

class Error extends TvShowState {
  final String message;

  Error(
    this.message,
  );

  @override
  List<Object?> get props => [message];
}
