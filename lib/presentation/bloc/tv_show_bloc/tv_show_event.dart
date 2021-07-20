part of 'tv_show_bloc.dart';

@immutable
abstract class TvShowEvent {}

class GetSavedTvShowsEvent extends TvShowEvent {}

class SearchSavedTvShowsEvent extends TvShowEvent {
  final String query;

  SearchSavedTvShowsEvent(
    this.query,
  );
}
