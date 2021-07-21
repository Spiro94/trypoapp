import 'episode.dart';
import 'show.dart';

class TvShow extends Show {
  final List<Episode> episodes;

  TvShow(int id, String name, String posterPath, String backdropPath,
      List<Episode> episodes)
      : this.episodes = episodes,
        super(id, name, posterPath, backdropPath);
}
