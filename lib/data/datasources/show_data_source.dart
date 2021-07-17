import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

import '../models/movie_model.dart';
import '../models/tv_show_model.dart';

abstract class ShowDataSource {
  Future<List<MovieModel>> getSavedMovies();
  Future<List<TvShowModel>> getSavedTvShows();
  Future<List<MovieModel>> searchSavedMovies(String query);
  Future<List<TvShowModel>> searchSavedTvShows(String query);
}

class ShowDataSourceImpl implements ShowDataSource {
  @override
  Future<List<MovieModel>> getSavedMovies() async {
    List<MovieModel> movies = [];
    // await Future<void>.delayed(Duration(seconds: 2));
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
    // await Future<void>.delayed(Duration(seconds: 2));
    var jsonText = await rootBundle.loadString('assets/json/tv_shows.json');
    var map = await json.decode(jsonText);
    for (var movie in map['results']) {
      movies.add(TvShowModel.fromJson(movie));
    }
    return movies;
  }

  @override
  Future<List<MovieModel>> searchSavedMovies(String query) async {
    List<MovieModel> movies = await getSavedMovies();
    if (query.isNotEmpty) {
      List<MovieModel> temp = [];
      movies.forEach((movie) {
        if (movie.name.toLowerCase().contains(query.toLowerCase())) {
          temp.add(movie);
        }
      });
      movies = temp;
    }

    return movies;
  }

  @override
  Future<List<TvShowModel>> searchSavedTvShows(String query) async {
    List<TvShowModel> tvShows = await getSavedTvShows();
    if (query.isNotEmpty) {
      List<TvShowModel> temp = [];
      tvShows.forEach((tvShow) {
        if (tvShow.name.toLowerCase().contains(query.toLowerCase())) {
          temp.add(tvShow);
        }
      });
      tvShows = temp;
    }
    return tvShows;
  }
}
