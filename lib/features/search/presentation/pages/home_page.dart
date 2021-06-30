import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:trypoapp/features/search/presentation/pages/show_details_page.dart';

import '../../../../core/error/failure.dart';
import '../../../../dependency_injection.dart';
import '../../data/models/movie_model.dart';
import '../../domain/usecases/get_saved_movies.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double viewportHeight = size.height;
    double viewportWidth = size.width;
    double width = size.width / 3;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: viewportHeight * .1,
            child: Center(
              child: TextField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: instance<GetSavedMovies>().call(),
            builder: (context,
                AsyncSnapshot<Either<Failure, List<MovieModel>>> snapshot) {
              Widget element = Center(
                child: CircularProgressIndicator(),
              );
              if (snapshot.hasError) {
                element = Text('Error');
              }
              if (snapshot.hasData) {
                snapshot.data!.fold((l) => element = Text('Error'), (r) {
                  element = Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 1.5,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: r.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShowDetailsPage(
                                      movie: r[index],
                                    ),
                                  ));
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Hero(
                                    tag: r[index].id,
                                    child: FadeInImage(
                                      height: width * 1.5,
                                      placeholder: AssetImage(
                                          'assets/images/placeholder.png'),
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500${r[index].posterPath}'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                });
              }
              return element;
            },
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter_sharp),
            label: 'TV Series',
          ),
        ],
      ),
    );
  }
}
