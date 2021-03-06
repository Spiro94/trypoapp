import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypoapp/core/domain/enums/alert_type.dart';
import 'package:trypoapp/features/search/presentation/pages/search_movies_page/widgets/modal_sheet.dart';
import '../../widgets/error.dart';
import '../add_alert/add_alert.dart';

import '../../bloc/search_movie/search_movie_bloc.dart';
import '../../widgets/loader.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/text.dart';

class SearchMoviesPage extends StatefulWidget {
  static const String routeName = '/search_movies_page';
  final bool isMovie;
  const SearchMoviesPage({
    Key? key,
    required this.isMovie,
  }) : super(key: key);

  @override
  _ShowsPageState createState() => _ShowsPageState();
}

class _ShowsPageState extends State<SearchMoviesPage> {
  final TextEditingController _controller = TextEditingController();
  String previousText = '';
  late Bloc bloc;
  AlertType alertType = AlertType.low;

  @override
  void initState() {
    _controller.addListener(() {
      if (previousText != _controller.text) {
        widget.isMovie
            ? bloc.add(MovieSearchEvent(_controller.text))
            : bloc.add(TvShowSearchEvent(_controller.text));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    double viewportHeight = size.height;

    bloc = BlocProvider.of<SearchMovieBloc>(context);

    int columns = orientation == Orientation.landscape ? 5 : 3;
    double width = size.width / columns;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          'Add ${widget.isMovie ? 'movie' : 'TV show'} alert',
          color: theme.accentColor,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
          builder: (context, state) {
            return Column(
              children: [
                SearchBar(
                  viewportHeight: viewportHeight,
                  hintText: 'Search ${widget.isMovie ? 'movie' : 'TV show'}',
                  controller: _controller,
                  onClosePressed: () {
                    _controller.clear();
                  },
                  onChanged: (text) {
                    previousText = text;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                if (state is InitialState)
                  Expanded(
                      child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Icon(Icons.lightbulb),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          'Search for a ${widget.isMovie ? 'movie' : 'TV show'} \nand add an alert to it!',
                          color: theme.accentColor,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ))
                else if (state is Loading)
                  const Expanded(
                      child: Center(
                    child: Loader(),
                  ))
                else if (state is Error)
                  const ErrorLabelWidget(message: 'Error obtaining data')
                else if (state is MoviesFetched)
                  _buildGridMovie(state, columns, width)
                else if (state is TvShowsFetched)
                  _buildGridTvShow(state, columns, width)
                else
                  const ErrorLabelWidget(message: 'State not implemented')
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    bloc.add(Clear());
    super.dispose();
  }

  Widget _buildGridMovie(MoviesFetched state, int columns, double width) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          childAspectRatio: 1 / 1.5,
        ),
        scrollDirection: Axis.vertical,
        itemCount: state.movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AddAlert.routeName,
                  arguments: state.movies[index]);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'search_${state.movies[index].id}',
                  child: state.movies[index].posterPath.isEmpty
                      ? const Image(
                          image: AssetImage(
                            'assets/images/placeholder.png',
                          ),
                        )
                      : FadeInImage(
                          height: width * 1.5,
                          placeholder: const AssetImage(
                            'assets/images/placeholder.png',
                          ),
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500${state.movies[index].posterPath}'),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridTvShow(TvShowsFetched state, int columns, double width) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          childAspectRatio: 1 / 1.5,
        ),
        scrollDirection: Axis.vertical,
        itemCount: state.tvShows.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              buildModalSheet(
                context,
                state.tvShows[index].name,
                (type) {
                  alertType = type;

                  print(alertType);
                },
              );
              // Navigator.pushNamed(context, AddAlert.routeName,
              //     arguments: state.tvShows[index]);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'search_${state.tvShows[index].id}',
                  child: FadeInImage(
                    height: width * 1.5,
                    placeholder: const AssetImage(
                      'assets/images/placeholder.png',
                    ),
                    image: NetworkImage(
                        //TODO: Update logic to include the case in which posterPath (or external image) is null/empty
                        'https://image.tmdb.org/t/p/w500${state.tvShows[index].posterPath}'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
