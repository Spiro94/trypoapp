import 'package:flutter/material.dart';

import '../../core/themes/font_theme.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const TextWidget(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Text(
      data,
      style: FontTheme.font.copyWith(
        color: color ?? theme.primaryColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
