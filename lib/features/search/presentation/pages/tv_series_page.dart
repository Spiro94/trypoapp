import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/error/failure.dart';
import '../../../../dependency_injection.dart';
import '../../data/models/tv_show_model.dart';
import '../../domain/usecases/get_saved_tv_shows.dart';
import '../widgets/search_bar.dart';
import 'show_details_page.dart';

class TvSeriesPage extends StatelessWidget {
  const TvSeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double viewportHeight = size.height;
    double viewportWidth = size.width;
    double width = size.width / 3;
    return SafeArea(
        child: Column(
      children: [
        SearchBar(
          viewportHeight: viewportHeight,
          hintText: 'Search TV series',
        ),
        SizedBox(
          height: 20,
        ),
        FutureBuilder(
          future: instance<GetSavedTvShows>().call(),
          builder: (context,
              AsyncSnapshot<Either<Failure, List<TvShowModel>>> snapshot) {
            Widget element = Expanded(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Loading data ...',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ));
            if (snapshot.hasError) {
              element = Expanded(
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
              ));
            }
            if (snapshot.hasData) {
              snapshot.data!.fold(
                  (l) => element = Expanded(
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
                      )), (r) {
                element = Expanded(
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(),
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
                                    tvShow: r[index],
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
    ));
  }
}
