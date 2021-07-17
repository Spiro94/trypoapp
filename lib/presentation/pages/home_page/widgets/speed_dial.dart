import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';

class SpeedDialWidget extends StatelessWidget {
  const SpeedDialWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      label: Text(
        'Add alert',
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
        ),
      ),
      icon: Icons.add,
      activeIcon: Icons.close,
      visible: true,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Add alert',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.movie),
          backgroundColor: Colors.white,
          label: 'Movies',
          labelStyle: GoogleFonts.montserrat(),
          onTap: () => print('FIRST CHILD'),
        ),
        SpeedDialChild(
          child: Icon(Icons.tv),
          backgroundColor: Colors.white,
          label: 'TV Series',
          labelStyle: GoogleFonts.montserrat(),
          onTap: () => print('SECOND CHILD'),
        ),
      ],
    );
  }
}
