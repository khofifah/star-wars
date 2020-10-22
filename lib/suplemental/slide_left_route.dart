import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideLeftRoute extends CupertinoPageRoute {
  final Widget page;
  final RouteSettings settings;
  SlideLeftRoute({this.page, this.settings})
      : super(builder: (BuildContext context) => page, settings: settings);
}
