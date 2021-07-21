import '../../../../core/domain/entities/episode.dart';
import '../../../../core/domain/entities/tv_show.dart';
import 'episode_model.dart';

class TvShowModel extends TvShow {
  TvShowModel(
    int id,
    String name,
    String posterPath,
    String backdropPath,
    List<Episode> episodes,
  ) : super(
          id,
          name,
          posterPath,
          backdropPath,
          episodes,
        );

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      json['id'],
      json['name'],
      json['poster_path'] ?? '',
      json['backdrop_path'] ?? '',
      (json['episodes'] as List).map((e) => EpisodeModel.fromJson(e)).toList(),
    );
  }
}
