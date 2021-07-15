part of 'show_bloc.dart';

@immutable
abstract class ShowEvent {}

class GetSavedMoviesEvent extends ShowEvent {}

class GetSavedTvShowsEvent extends ShowEvent {}
