import 'package:flutter/material.dart';

import 'text.dart';

class ErrorLabelWidget extends StatelessWidget {
  final String message;
  const ErrorLabelWidget({
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
