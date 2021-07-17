import 'episode.dart';
import 'show.dart';

class TvShow extends Show {
  late List<Episode> episodes;

  TvShow(int id, String name, String posterPath, String backdropPath,
      List<Episode> episodes)
      : super(id, name, posterPath, backdropPath) {
    this.episodes = episodes;
  }
}