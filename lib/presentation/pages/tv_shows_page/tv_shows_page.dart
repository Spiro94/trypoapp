import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/shows_bloc/movies_bloc.dart';

import '../../bloc/shows_bloc/tv_shows_bloc.dart';

import '../../widgets/loader.dart';
import '../../widgets/search_bar.dart';
import '../show_details_page/show_details_page.dart';

class TvShowsPage extends StatefulWidget {
  const TvShowsPage({
    Key? key,
  }) : super(key: key);

  @override
  _ShowsPageState createState() => _ShowsPageState();
}

class _ShowsPageState extends State<TvShowsPage> {
  late TextEditingController _controller = TextEditingController();

  late Bloc bloc;

  @override
  void initState() {
    _controller.addListener(() {
      bloc.add(SearchSavedTvShowsEvent(_controller.text));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    double viewportHeight = size.height;

    bloc = BlocProvider.of<TvShowsBloc>(context);

    int columns = orientation == Orientation.landscape ? 5 : 3;
    double width = size.width / columns;

    return SafeArea(
      child: BlocBuilder<TvShowsBloc, ShowState>(
        builder: (context, state) {
          return Column(
            children: [
              SearchBar(
                viewportHeight: viewportHeight,
                hintText: 'Search TV Shows',
                controller: _controller,
                onClosePressed: () {
                  _controller.clear();
                },
              ),
              SizedBox(
                height: 5,
              ),
              if (state is Loading)
                Expanded(
                    child: Center(
                  child: Loader(),
                ))
              else if (state is Error)
                ErrorWidget('Error obtaining data')
              else if (state is TvShowsFetched)
                _buildGrid(state, columns, width)
              else
                ErrorWidget('State not implemented')
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

  Widget _buildGrid(TvShowsFetched state, int columns, double width) {
    return Expanded(
      child: RefreshIndicator(
        displacement: 60,
        onRefresh: () async => bloc.add(GetSavedTvShowsEvent()),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              childAspectRatio: 1 / 1.5,
            ),
            scrollDirection: Axis.vertical,
            itemCount: state.tvShows.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowDetailsPage(
                          tvShow: state.tvShows[index],
                        ),
                      ));
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: state.tvShows[index].id,
                        child: FadeInImage(
                          height: width * 1.5,
                          placeholder: AssetImage(
                            'assets/images/placeholder.png',
                          ),
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500${state.tvShows[index].posterPath}'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
