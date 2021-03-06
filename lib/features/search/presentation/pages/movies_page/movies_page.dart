import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/error.dart';

import '../../bloc/movie_bloc/movie_bloc.dart';
import '../../widgets/loader.dart';
import '../../widgets/search_bar.dart';
import '../show_details_page/show_details_page.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({
    Key? key,
  }) : super(key: key);

  @override
  _ShowsPageState createState() => _ShowsPageState();
}

class _ShowsPageState extends State<MoviesPage> {
  final TextEditingController _controller = TextEditingController();

  late Bloc bloc;

  @override
  void initState() {
    _controller.addListener(() {
      bloc.add(SearchSavedMoviesEvent(_controller.text));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    double viewportHeight = size.height;

    bloc = BlocProvider.of<MovieBloc>(context);

    int columns = orientation == Orientation.landscape ? 5 : 3;
    double width = size.width / columns;

    return SafeArea(
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return Column(
            children: [
              SearchBar(
                viewportHeight: viewportHeight,
                hintText: 'Search movies',
                controller: _controller,
                onClosePressed: () {
                  _controller.clear();
                },
              ),
              const SizedBox(
                height: 5,
              ),
              if (state is Loading)
                const Expanded(
                    child: Center(
                  child: Loader(),
                ))
              else if (state is Error)
                const ErrorLabelWidget(message: 'Error obtaining data')
              else if (state is MoviesFetched)
                _buildGrid(state, columns, width)
              else
                const ErrorLabelWidget(message: 'State not implemented')
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildGrid(MoviesFetched state, int columns, double width) {
    return Expanded(
      child: RefreshIndicator(
        displacement: 60,
        onRefresh: () async => bloc.add(GetSavedMoviesEvent()),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowDetailsPage(
                          movie: state.movies[index],
                        ),
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: state.movies[index].id,
                      child: FadeInImage(
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
        ),
      ),
    );
  }
}
