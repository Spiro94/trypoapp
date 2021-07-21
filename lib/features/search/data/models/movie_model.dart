import '../../../../core/domain/entities/movie.dart';
import 'alert_model.dart';

class MovieModel extends Movie {
  MovieModel(
    int id,
    String name,
    String posterPath,
    String backdropPath,
    List<AlertModel> alerts,
  ) : super(
          id,
          name,
          posterPath,
          backdropPath,
          alerts,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      json['id'],
      json['title'],
      json['poster_path'] ?? '',
      json['backdrop_path'] ?? '',
      (json['alerts'] as List? ?? [])
          .map((e) => AlertModel.fromJson(e))
          .toList(),
    );
  }
}
