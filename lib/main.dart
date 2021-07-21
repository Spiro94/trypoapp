import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/router.dart';
import 'core/themes/app_theme.dart';
import 'dependency_injection/dependency_injection.dart';
import 'features/search/presentation/bloc/movie_bloc/movie_bloc.dart';
import 'features/search/presentation/bloc/search_movie/search_movie_bloc.dart';
import 'features/search/presentation/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'features/search/presentation/pages/home_page/home_page.dart';

void main() async {
  await init();
  runApp(TrypoApp());
}

class TrypoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (BuildContext context) =>
              instance<MovieBloc>()..add(GetSavedMoviesEvent()),
        ),
        BlocProvider<TvShowBloc>(
          create: (BuildContext context) =>
              instance<TvShowBloc>()..add(GetSavedTvShowsEvent()),
        ),
        BlocProvider<SearchMovieBloc>(
          create: (BuildContext context) => instance<SearchMovieBloc>(),
        ),
      ],
      child: MaterialWidget(),
    );
  }
}

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: getRoutes(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      title: 'Trypoapp',
      initialRoute: HomePage.routeName,
      onGenerateRoute: TypoAppRouter().generateRoute,
    );
  }
}
