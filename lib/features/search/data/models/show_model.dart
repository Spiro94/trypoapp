import '../../domain/entities/show.dart';

class ShowModel extends Show {
  ShowModel(
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
    };
  }
}
