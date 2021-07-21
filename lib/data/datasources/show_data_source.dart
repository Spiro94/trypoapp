import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/secrets.dart';
import '../../core/error/exceptions.dart';

import '../models/movie_model.dart';
import '../models/tv_show_model.dart';

abstract class ShowDataSource {
  Future<List<MovieModel>> getSavedMovies();
  Future<List<TvShowModel>> getSavedTvShows();
  Future<List<MovieModel>> searchSavedMovies(String query);
  Future<List<TvShowModel>> searchSavedTvShows(String query);
  Future<List<MovieModel>> searchMovies(String query);
  Future<List<TvShowModel>> searchTvShows(String query);
}

class ShowDataSourceImpl implements ShowDataSource {
  final http.Client client;
  final String url = 'https://api.themoviedb.org/3/';

  ShowDataSourceImpl(this.client);

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
    List<TvShowModel> tvShows = [];
    // await Future<void>.delayed(Duration(seconds: 2));
    var jsonText = await rootBundle.loadString('assets/json/tv_shows.json');
    var map = await json.decode(jsonText);
    for (var movie in map['results']) {
      tvShows.add(TvShowModel.fromJson(movie));
    }
    return tvShows;
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

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    List<MovieModel> movies = [];
    try {
      var response = await http.get(Uri.parse(url +
          'search/movie?api_key=${MOVIE_API_KEY}&language=en-US&query=${query}&page=1&include_adult=false'));
      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);
        for (var movie in jsonMap['results']) {
          movies.add(MovieModel.fromJson(movie));
        }
      } else {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }

    return movies;
  }

  @override
  Future<List<TvShowModel>> searchTvShows(String query) {
    // TODO: implement searchTvShows
    throw UnimplementedError();
  }
}
