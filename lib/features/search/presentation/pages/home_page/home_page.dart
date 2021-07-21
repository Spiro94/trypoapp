import 'package:flutter/material.dart';

import '../movies_page/movies_page.dart';
import '../tv_shows_page/tv_shows_page.dart';
import 'widgets/bottom_navigation.dart';
import 'widgets/speed_dial.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _bodies = [MoviesPage(), TvShowsPage()];
  int _active = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _bodies[_active],
      floatingActionButton: SpeedDialWidget(),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _active,
        onTap: (index) {
          setState(() {
            _active = index;
          });
        },
      ),
    );
  }
}
