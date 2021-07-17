import 'package:flutter/material.dart';
import '../../presentation/pages/home_page/home_page.dart';
import '../../presentation/pages/show_details_page/show_details_page.dart';

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    HomePage.routeName: (context) => HomePage(),
    ShowDetailsPage.routeName: (context) => ShowDetailsPage(),
  };
}
