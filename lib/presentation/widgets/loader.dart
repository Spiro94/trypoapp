import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: theme.accentColor,
        ),
        SizedBox(
          height: 10,
        ),
        TextWidget(
          'Loading data ...',
          color: theme.accentColor,
        )
      ],
    );
  }
}
