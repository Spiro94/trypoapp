import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:trypoapp/core/domain/entities/movie.dart';
import 'package:trypoapp/core/domain/entities/show.dart';
import 'package:trypoapp/features/search/data/models/movie_model.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final MovieModel movieModel = MovieModel(
    158015,
    'The Purge',
    '/1x4fHaDdlpWT5P2UV4ClKguWbTE.jpg',
    '/siBfSB55FBc7IdvgtApq6NaXNHw.jpg',
    [],
  );
  test('should be a subclass of Movie entity', () async {
    //arrange

    //act

    //assert
    expect(movieModel, isA<Movie>());
  });
  test('should be a subclass of Show entity', () async {
    //arrange

    //act

    //assert
    expect(movieModel, isA<Show>());
  });
  group('fromJson', () {
    test('should return a valid model when the JSON is valid', () async {
      //arrange
      final MovieModel result =
          MovieModel.fromJson(json.decode(fixture('models.json'))['movie']);
      //act

      //assert
      expect(result, movieModel);
    });
  });
}
