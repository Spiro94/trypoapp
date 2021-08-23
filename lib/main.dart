import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypoapp/amplifyconfiguration.dart';

import 'core/routes/router.dart';
import 'core/themes/app_theme.dart';
import 'dependency_injection/dependency_injection.dart';
import 'features/search/presentation/bloc/movie_bloc/movie_bloc.dart';
import 'features/search/presentation/bloc/search_movie/search_movie_bloc.dart';
import 'features/search/presentation/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'features/search/presentation/pages/home_page/home_page.dart';

void main() async {
  await init();
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(const TrypoApp());
}

Future<void> configureAmplify() async {
  Amplify.addPlugins([AmplifyAuthCognito()]);
  try {
    await Amplify.configure(amplifyconfig);
  } catch (e) {
    // print('Amplify error');
  }
}

class TrypoApp extends StatelessWidget {
  const TrypoApp({Key? key}) : super(key: key);

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
      child: const MaterialWidget(),
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
