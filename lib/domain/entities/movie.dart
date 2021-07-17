import 'alert.dart';
import 'show.dart';

class Movie extends Show {
  List<Alert> alerts;

  Movie(int id, String name, String posterPath, String backdropPath,
      List<Alert> alerts)
      : this.alerts = alerts,
        super(id, name, posterPath, backdropPath);
}
