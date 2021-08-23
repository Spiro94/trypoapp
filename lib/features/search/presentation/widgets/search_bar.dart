import 'package:flutter/material.dart';

import '../../../../core/themes/font_theme.dart';

class SearchBar extends StatelessWidget {
  final double viewportHeight;
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClosePressed;

  const SearchBar({
    Key? key,
    required this.viewportHeight,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.onClosePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: viewportHeight * .1,
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          style: FontTheme.font.copyWith(
            color: theme.accentColor,
          ),
          cursorColor: theme.accentColor,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: FontTheme.font.copyWith(
              color: theme.unselectedWidgetColor,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: theme.accentColor,
            ),
            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    onPressed: onClosePressed,
                    icon: Icon(
                      Icons.close,
                      color: theme.accentColor,
                    ))
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            enabledBorder: getBorder(theme),
            focusedBorder: getBorder(theme),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder getBorder(ThemeData theme) {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.accentColor,
        ),
        borderRadius: BorderRadius.circular(30));
  }
}
