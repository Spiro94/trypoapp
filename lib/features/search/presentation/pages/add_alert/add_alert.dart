import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trypoapp/core/domain/entities/movie.dart';
import 'package:trypoapp/core/domain/entities/tv_show.dart';

import '../../widgets/text.dart';

class AddAlert extends StatefulWidget {
  static const String routeName = '/add_alert';
  final Movie? movie;
  final TvShow? tvShow;

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
