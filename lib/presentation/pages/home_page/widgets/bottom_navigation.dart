import 'package:flutter/material.dart';

import '../../../../core/themes/font_theme.dart';

class BottomNavigationWidget extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int currentIndex;
  const BottomNavigationWidget({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      selectedLabelStyle: FontTheme.font,
      unselectedLabelStyle: FontTheme.font,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.movie,
            size: 30,
          ),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.tv,
            size: 30,
          ),
          label: 'TV Series',
        ),
      ],
    );
  }
}
