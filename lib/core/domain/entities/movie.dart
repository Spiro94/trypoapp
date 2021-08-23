import 'alert.dart';
import 'show.dart';

class Movie extends Show {
  final List<Alert> alerts;

  const Movie(
    int id,
    String name,
    String posterPath,
    String backdropPath,
    this.alerts,
  ) : super(id, name, posterPath, backdropPath);
}
