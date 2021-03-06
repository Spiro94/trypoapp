import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../../core/domain/entities/episode.dart';
import '../../../../../core/domain/entities/movie.dart';
import '../../../../../core/domain/entities/tv_show.dart';
import '../../widgets/text.dart';
import 'widgets/alert_widget.dart';

class ShowDetailsPage extends StatelessWidget {
  static const String routeName = '/show_details';
  final Movie? movie;
  final TvShow? tvShow;
  const ShowDetailsPage({Key? key, this.movie, this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.primaryColor,
        appBar: AppBar(
          brightness: Brightness.dark,
          title: TextWidget(
            movie == null ? 'TV Show details' : 'Movie details',
            color: theme.accentColor,
          ),
        ),
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          Hero(
            tag: movie == null ? tvShow!.id : movie!.id,
            child: FadeInImage(
              placeholder:
                  const AssetImage('assets/images/placeholder_back.jpg'),
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movie == null ? tvShow!.backdropPath : movie!.backdropPath}'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextWidget(
            movie == null ? tvShow!.name : movie!.name,
            color: theme.accentColor,
            fontSize: 30,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          TextWidget(
            'Identified alerts',
            textAlign: TextAlign.center,
            color: theme.accentColor,
          ),
          const SizedBox(
            height: 20,
          ),
          movie == null
              ? _buildTvShowsAlerts(context, theme)
              : _buildMovieAlerts(context, theme)
        ]));
  }

  Widget _buildMovieAlerts(BuildContext context, ThemeData theme) => Column(
      children: movie!.alerts
          .map(
            (alert) => AlertWidget(alert: alert),
          )
          .toList());

  Widget _buildTvShowsAlerts(BuildContext context, ThemeData theme) {
    final filtro = groupBy(tvShow!.episodes, (Episode e) => e.season);
    List<Widget> episodeWidgets = [];
    filtro.forEach((key, episodes) {
      episodeWidgets.add(Column(
        children: [
          TextWidget(
            'Season ${key.toString()}',
            fontSize: 20,
            color: theme.accentColor,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: episodes
                .map((episode) => Column(
                      children: [
                        TextWidget(
                          'Episode ${episode.episode.toString()}',
                          fontSize: 15,
                          color: theme.accentColor,
                        ),
                        Column(
                          children: episode.alerts
                              .map(
                                (alert) => AlertWidget(alert: alert),
                              )
                              .toList(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ))
                .toList(),
          )
        ],
      ));
    });
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: episodeWidgets,
      ),
    );
  }
}
