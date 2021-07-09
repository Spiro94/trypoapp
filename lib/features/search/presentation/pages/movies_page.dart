import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../dependency_injection.dart';
import '../../data/models/movie_model.dart';
import '../../domain/usecases/get_saved_movies.dart';
import '../widgets/loader.dart';
import '../widgets/search_bar.dart';
import 'show_details_page.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  bool _isLoading = false;
  bool _error = false;
  List<MovieModel> _moviesList = [];
  List<MovieModel> _filteredList = [];
  late TextEditingController _controller = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    _getMovies();
    _controller.addListener(() {
      _filteredList = _moviesList;
      if (_controller.text.isEmpty) {
        _searchQuery = '';
      } else {
        _searchQuery = _controller.text;
      }
      setState(() {});
    });
    super.initState();
  }

  void _getMovies() async {
    _isLoading = true;
    var futureResult = await instance<GetSavedMovies>().call(NoParams());
    _isLoading = false;
    setState(() {
      futureResult.fold((l) => _error = true, (r) => _moviesList = r);
      _filteredList = _moviesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    double viewportHeight = size.height;

    int columns = orientation == Orientation.landscape ? 5 : 3;
    double width = size.width / columns;

    _validateSearch();

    return SafeArea(
        child: Column(
      children: [
        SearchBar(
          viewportHeight: viewportHeight,
          hintText: 'Search movies',
          controller: _controller,
          onClosePressed: () {
            _filteredList = _moviesList;
            _controller.clear();
            FocusScope.of(context).unfocus();
          },
        ),
        SizedBox(
          height: 5,
        ),
        if (_isLoading)
          Expanded(
              child: Center(
            child: Loader(),
          ))
        else if (_error)
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Error obtaining data',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ))
        else
          Expanded(
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  childAspectRatio: 1 / 1.5,
                ),
                scrollDirection: Axis.vertical,
                itemCount: _filteredList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowDetailsPage(
                              movie: _filteredList[index],
                            ),
                          ));
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: _filteredList[index].id,
                            child: FadeInImage(
                              height: width * 1.5,
                              placeholder: AssetImage(
                                'assets/images/placeholder.png',
                              ),
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${_filteredList[index].posterPath}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
      ],
    ));
  }

  void _validateSearch() {
    if (_searchQuery.isNotEmpty) {
      List<MovieModel> temp = [];
      _filteredList.forEach((movie) {
        if (movie.name.toLowerCase().contains(_searchQuery.toLowerCase())) {
          temp.add(movie);
        }
      });

      _filteredList = temp;
    }
  }
}
