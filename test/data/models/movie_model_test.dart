import 'package:flutter_test/flutter_test.dart';
import 'package:trypoapp/data/models/movie_model.dart';
import 'package:trypoapp/domain/entities/show.dart';

void main() {
  group('MovieModel', () {
    late final MovieModel movieModel;
    setUpAll(() {
      movieModel = MovieModel(
        1,
        'name',
        'posterPath',
        'backdropPath',
        [],
      );
    });
    test('should be a subclass of Show', () async {
      //arrange

      //act

      //assert
      expect(movieModel, isA<Show>());
    });
  });
}
