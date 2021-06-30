import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

import '../models/movie_model.dart';
import '../models/tv_show_model.dart';

abstract class ShowDataSource {
  Future<List<MovieModel>> getSavedMovies();
  Future<List<TvShowModel>> getSavedTvShows();
}

class ShowDataSourceImpl implements ShowDataSource {
  @override
  Future<List<MovieModel>> getSavedMovies() async {
    List<MovieModel> movies = [];
    await Future<void>.delayed(Duration(seconds: 2));
    var jsonText = await rootBundle.loadString('assets/json/movies.json');
    var map = await json.decode(jsonText);
    for (var movie in map['results']) {
      movies.add(MovieModel.fromJson(movie));
    }
    return movies;
  }

  @override
  Future<List<TvShowModel>> getSavedTvShows() async {
    List<TvShowModel> movies = [];
    await Future<void>.delayed(Duration(seconds: 2));
    var jsonText = await rootBundle.loadString('assets/json/tv_shows.json');
    var map = await json.decode(jsonText);
    for (var movie in map['results']) {
      movies.add(TvShowModel.fromJson(movie));
    }
    return movies;
  }
}
