import 'package:flutter/material.dart';

class MyPage extends Page {
  final WidgetBuilder builder;
  final String desc;

  MyPage({
    @required LocalKey key,
    @required String name,
    @required this.desc,
    @required this.builder,
  }) : super(key: key, name: name);

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(builder: builder, settings: this);
  }

  @override
  String toString() {
    return name;
  }
}
