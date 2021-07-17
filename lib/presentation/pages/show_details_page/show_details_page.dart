import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/alert_model.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/models/tv_show_model.dart';
import '../../../domain/entities/episode.dart';
import '../../widgets/alert_widget.dart';

class ShowDetailsPage extends StatelessWidget {
  static String routeName = '/show_details';
  final MovieModel? movie;
  final TvShowModel? tvShow;
  const ShowDetailsPage({Key? key, this.movie, this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text(
            movie == null ? 'TV Show details' : 'Movie details',
            style: GoogleFonts.montserrat(),
          ),
        ),
        body: ListView(physics: BouncingScrollPhysics(), children: [
          Hero(
            tag: movie == null ? tvShow!.id : movie!.id,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/placeholder_back.jpg'),
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movie == null ? tvShow!.backdropPath : movie!.backdropPath}'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            movie == null ? tvShow!.name : movie!.name,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Identified alerts',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          movie == null
              ? _buildTvShowsAlerts(context)
              : _buildMovieAlerts(context)
        ]));
  }

  Widget _buildMovieAlerts(BuildContext context) {
    return Column(
        children: movie!.alerts
            .map(
              (alert) => AlertWidget(alert: alert as AlertModel),
            )
            .toList());
  }

  Widget _buildTvShowsAlerts(BuildContext context) {
    final filtro = groupBy(tvShow!.episodes, (Episode e) => e.season);
    List<Widget> episodeWidgets = [];
    filtro.forEach((key, episodes) {
      episodeWidgets.add(Column(
        children: [
          Text(
            'Season ${key.toString()}',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: episodes
                .map((episode) => Column(
                      children: [
                        Text(
                          'Episode ${episode.episode.toString()}',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: episode.alerts
                              .map(
                                (alert) =>
                                    AlertWidget(alert: alert as AlertModel),
                              )
                              .toList(),
                        ),
                        SizedBox(
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
