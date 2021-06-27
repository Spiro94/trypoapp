import 'alert.dart';
import 'show.dart';

class Movie extends Show {
  late List<Alert> alerts;

  Movie(int id, String name, String posterPath, String backdropPath,
      List<Alert> alerts)
      : super(id, name, posterPath, backdropPath) {
    this.alerts = alerts;
  }
}
