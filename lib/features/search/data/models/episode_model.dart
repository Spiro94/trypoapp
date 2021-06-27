import '../../domain/entities/alert.dart';
import '../../domain/entities/episode.dart';
import 'alert_model.dart';

class EpisodeModel extends Episode {
  EpisodeModel(
    int season,
    int episode,
    List<Alert> alerts,
  ) : super(
          season,
          episode,
          alerts,
        );
  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      json['season'],
      json['episode'],
      (json['alerts'] as List).map((e) => AlertModel.fromJson(e)).toList(),
    );
  }
}
