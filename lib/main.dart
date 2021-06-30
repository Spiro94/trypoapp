import 'package:flutter/material.dart';
import 'core/routes/routes.dart';

import 'dependency_injection.dart';
import 'features/search/presentation/pages/home_page.dart';

void main() async {
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getRoutes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      title: 'Trypoapp',
      initialRoute: HomePage.routeName,
    );
  }
}
