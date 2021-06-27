import '../../domain/entities/search.dart';

class SearchModel extends Search {
  SearchModel(
    int id,
    String name,
    String posterPath,
    String backdropPath,
  ) : super(
          id,
          name,
          posterPath,
          backdropPath,
        );

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      json['id'],
      json['title'],
      json['poster_path'] ?? '',
      json['backdrop_path'] ?? '',
    );
  }
}
