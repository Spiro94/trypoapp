import 'package:flutter/material.dart';

import '../../data/models/movie_model.dart';
import '../../data/models/tv_show_model.dart';

class ShowDetailsPage extends StatelessWidget {
  static String routeName = '/show_details';
  final MovieModel? movie;
  final TvShowModel? tvShow;
  const ShowDetailsPage({Key? key, this.movie, this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: movie == null ? _buildTvShowsAlerts() : _buildMovieAlerts(),
    );
  }

  Widget _buildMovieAlerts() {
    return SafeArea(
      child: ListView(children: [
        Hero(
          tag: movie!.id,
          child: FadeInImage(
            placeholder: AssetImage('assets/images/placeholder_backdrop.png'),
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500${movie!.backdropPath}'),
          ),
        ),
        Text(
          movie!.name,
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Alertas identificadas',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 70),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [Text('Comienzo'), Text('01:10:00')],
              ),
              Column(
                children: [Text('Final'), Text('01:15:00')],
              )
            ],
          ),
          color: Colors.red,
        ),
        // Expanded(
        //     child: ListView.separated(
        //   separatorBuilder: (context, index) => SizedBox(
        //     height: 10,
        //   ),
        //   itemCount: 10,
        //   itemBuilder: (context, index) => Card(
        //     child: Container(
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Column(
        //             children: [Text('Comienzo'), Text('01:10:00')],
        //           ),
        //           Column(
        //             children: [Text('Final'), Text('01:10:00')],
        //           )
        //         ],
        //       ),
        //       color: Colors.red,
        //     ),
        //   ),
        // ))
      ]),
    );
  }

  Widget _buildTvShowsAlerts() {
    return Center(
      child: Container(
        child: Text(tvShow!.name),
      ),
    );
  }
}
