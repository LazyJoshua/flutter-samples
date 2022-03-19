import 'package:flutter/material.dart';

import 'animate_containier.dart';
import 'home_page.dart';
import 'my_page.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class RootApp extends StatefulWidget {
  RootApp({Key key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  // final _naviPages = [
  //   MyPage(
  //       key: Key('/'),
  //       name: '/',
  //       desc: '首页',
  //       builder: (context) => HomePage(
  //             addPage: (MyPage page) {},
  //           ))
  // ];
  final List<MyPage> _naviPages = [];

  void _addPage(MyPage page) {
    setState(() {
      _naviPages.add(page);
    });
  }

  @override
  void initState() {
    super.initState();
    HomePage homePage = HomePage(addPage: _addPage);
    _naviPages.add(MyPage(
        key: Key('/'), name: '/', desc: '首页', builder: (context) => homePage));
    _naviPages.add(MyPage(
        key: Key('/animate_container'),
        name: '/animate_container',
        desc: '可变容器动画',
        builder: (context) => AnimateContainerDemo()));
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    setState(() {
      print('remove ${route.settings}');
      _naviPages.remove(route.settings);
    });
    return route.didPop(result);
  }

  @override
  Widget build(BuildContext context) {
    print('build: $_naviPages');
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Navigator(
          key: _navigatorKey,
          onPopPage: _onPopPage,
          pages: List.of(_naviPages),
        ));
  }
}
