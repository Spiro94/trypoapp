import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/themes/app_theme.dart';
import 'presentation/bloc/show_bloc/movies_bloc.dart';
import 'presentation/bloc/show_bloc/tv_shows_bloc.dart';

import 'presentation/pages/home_page/home_page.dart';

import 'core/routes/routes.dart';

import 'dependency_injection/dependency_injection.dart';

void main() async {
  await init();
  runApp(TrypoApp());
}

class TrypoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
          create: (BuildContext context) =>
              instance<MoviesBloc>()..add(GetSavedMoviesEvent()),
        ),
        BlocProvider<TvShowsBloc>(
          create: (BuildContext context) =>
              instance<TvShowsBloc>()..add(GetSavedTvShowsEvent()),
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
      routes: getRoutes(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      title: 'Trypoapp',
      initialRoute: HomePage.routeName,
    );
  }
}
