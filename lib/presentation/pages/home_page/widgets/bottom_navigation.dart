import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: GoogleFonts.montserrat(),
      unselectedLabelStyle: GoogleFonts.montserrat(),
      backgroundColor: Color.fromARGB(255, 52, 50, 50),
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
