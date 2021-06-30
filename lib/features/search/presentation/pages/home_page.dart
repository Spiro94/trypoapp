import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';

import 'movies_page.dart';
import 'tv_series_page.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List pages = [
    MoviesPage(),
    TvSeriesPage(),
  ];
  late Widget _activePage;

  int _active = 0;

  @override
  void initState() {
    _activePage = pages[_active];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _activePage,
      floatingActionButton: _buildSpeedDial(),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  SpeedDial _buildSpeedDial() {
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

  BottomNavigationBar _buildNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _active = index;
          _activePage = pages[index];
        });
      },
      currentIndex: _active,
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
