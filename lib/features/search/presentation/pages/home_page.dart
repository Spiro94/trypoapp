import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failure.dart';
import '../../../../dependency_injection.dart';
import '../../data/models/movie_model.dart';
import '../../domain/usecases/get_saved_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
        future: instance<GetSavedMovies>().call(),
        builder: (context,
            AsyncSnapshot<Either<Failure, List<MovieModel>>> snapshot) {
          Widget element = CircularProgressIndicator();
          if (snapshot.hasError) {
            element = Text('Error');
          }
          if (snapshot.hasData) {
            snapshot.data!.fold((l) => element = Text('Error'), (r) {
              element = Container(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: r.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print('TAP');
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          width: 100,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${r[index].posterPath}'),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(r[index].name),
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
    ));
  }
}
