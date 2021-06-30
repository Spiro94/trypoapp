import 'package:flutter/material.dart';

import '../../features/search/presentation/pages/home_page.dart';
import '../../features/search/presentation/pages/show_details_page.dart';

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    HomePage.routeName: (context) => HomePage(),
    ShowDetailsPage.routeName: (context) => ShowDetailsPage(),
  };
}
