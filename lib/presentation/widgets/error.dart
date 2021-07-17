import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text.dart';

class ErrorWidget extends StatelessWidget {
  final String message;
  const ErrorWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Expanded(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: theme.accentColor,
          ),
          SizedBox(
            height: 10,
          ),
          TextWidget(
            message,
            color: theme.accentColor,
          )
        ],
      ),
    ));
  }
}
