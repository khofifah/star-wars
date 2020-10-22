import 'package:flutter/material.dart';
import 'package:starwars/content/style.dart';
import 'package:starwars/screen/Detail.dart';
import 'package:starwars/screen/Films.dart';
import 'package:starwars/suplemental/slide_left_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navKey = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      title: 'Star Wars',
      routes: {
        '/': (context) => FilmsPage(),
      },
      onGenerateRoute: _getRoute,
      theme: themeData,
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/detail':
      return SlideLeftRoute(page: DetailPage(), settings: settings);
      break;
    default:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => FilmsPage(),
        fullscreenDialog: true,
      );
  }
}
