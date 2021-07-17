import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/themes/font_theme.dart';
import '../../../widgets/text.dart';

class SpeedDialWidget extends StatelessWidget {
  const SpeedDialWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SpeedDial(
      label: TextWidget(
        'Add alert',
        fontWeight: FontWeight.w500,
      ),
      icon: Icons.add,
      activeIcon: Icons.close,
      visible: true,
      curve: Curves.bounceIn,
      overlayColor: theme.primaryColor,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Add alert',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: theme.accentColor,
      foregroundColor: theme.primaryColor,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.movie),
          backgroundColor: theme.accentColor,
          label: 'Movies',
          labelStyle: FontTheme.font.copyWith(
            color: theme.primaryColor,
          ),
          onTap: () => print('FIRST CHILD'),
        ),
        SpeedDialChild(
          child: Icon(Icons.tv),
          backgroundColor: theme.accentColor,
          label: 'TV Series',
          labelStyle: FontTheme.font.copyWith(
            color: theme.primaryColor,
          ),
          onTap: () => print('SECOND CHILD'),
        ),
      ],
    );
  }
}
