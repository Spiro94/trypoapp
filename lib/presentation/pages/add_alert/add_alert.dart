import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movie_model.dart';
import '../../../data/models/tv_show_model.dart';
import '../../widgets/text.dart';

class AddAlert extends StatefulWidget {
  static const String routeName = '/add_alert';
  final MovieModel? movie;
  final TvShowModel? tvShow;

  const AddAlert({
    Key? key,
    this.movie,
    this.tvShow,
  }) : super(key: key);

  @override
  _AddAlertState createState() => _AddAlertState();
}

class _AddAlertState extends State<AddAlert> {
  late Bloc bloc;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: TextWidget(
            'Add Alert',
            color: theme.accentColor,
          ),
        ),
        body: ListView(
          children: [
            TextWidget(
              'Input 1',
              color: theme.accentColor,
            ),
            TextWidget(
              'Input 2',
              color: theme.accentColor,
            ),
            TextWidget(
              'Input 3',
              color: theme.accentColor,
            ),
          ],
        ));
  }
}
