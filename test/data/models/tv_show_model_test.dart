import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:trypoapp/data/models/tv_show_model.dart';
import 'package:trypoapp/domain/entities/show.dart';
import 'package:trypoapp/domain/entities/tv_show.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final TvShowModel tvShowModel = TvShowModel(
    56570,
    'Outlander',
    '/70PRIpG1phOyphejeLwi0K8zdJo.jpg',
    '/qutOe29dCGmT2JUlLPCqlzaQIo.jpg',
    [],
  );
  test('should be a subclass of TvShow entity', () async {
    //arrange

    //act

    //assert
    expect(tvShowModel, isA<TvShow>());
  });
  test('should be a subclass of Show entity', () async {
    //arrange

    //act

    //assert
    expect(tvShowModel, isA<Show>());
  });
  group('fromJson', () {
    test('should return a valid model when the JSON is valid', () async {
      //arrange
      final TvShowModel result =
          TvShowModel.fromJson(json.decode(fixture('models.json'))['tv_show']);
      //act

      //assert
      expect(result, tvShowModel);
    });
  });
}
