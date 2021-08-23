import 'episode.dart';
import 'show.dart';

class TvShow extends Show {
  final List<Episode> episodes;

  const TvShow(int id, String name, String posterPath, String backdropPath,
      this.episodes)
      : super(id, name, posterPath, backdropPath);
}
