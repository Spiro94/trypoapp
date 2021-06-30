import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: movie == null
          ? _buildTvShowsAlerts(context)
          : _buildMovieAlerts(context),
    );
  }

  Widget _buildMovieAlerts(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Movie details',
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Hero(
            tag: movie!.id,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/placeholder_back.jpg'),
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movie!.backdropPath}'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            movie!.name,
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
            'Alertas identificadas',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
            color: Colors.orange,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
            color: Colors.yellow,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
            color: Colors.yellow,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
            color: Colors.yellow,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }

  Widget _buildTvShowsAlerts(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'TV Show details',
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Hero(
            tag: tvShow!.id,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/placeholder_back.jpg'),
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${tvShow!.backdropPath}'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            tvShow!.name,
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
            'Alertas identificadas',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Season 1',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Episode 1',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
                Text(
                  'Episode 5',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
                  color: Colors.orange,
                ),
                Text(
                  'Season 2',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Episode 8',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
                  color: Colors.yellow,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
                Text(
                  'Episode 10',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
                  color: Colors.yellow,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
                  color: Colors.yellow,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
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
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
