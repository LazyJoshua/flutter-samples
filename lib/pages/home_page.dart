import 'package:flutter/material.dart';
import 'package:sample_app/pages/animate_containier.dart';
import 'package:sample_app/pages/async_demo.dart';
import 'package:sample_app/pages/default_example.dart';
import 'package:sample_app/pages/fade_animation.dart';
import 'package:sample_app/pages/isolate_demo.dart';
import 'package:sample_app/pages/life_cycle.dart';
import 'package:sample_app/pages/linearlayout_demo.dart';
import 'package:sample_app/pages/list_view_demo.dart';
import 'package:sample_app/pages/my_page.dart';
import 'package:sample_app/pages/signature_example.dart';
import 'package:sample_app/pages/state_example.dart';

import 'draggable_card.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

typedef AddPage = void Function(MyPage page);

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

class HomePage extends StatefulWidget {
  final AddPage addPage;
  const HomePage({Key key, this.addPage}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(addPage);
}

class _HomePageState extends State<HomePage> {
  final Function addPage;

  _HomePageState(this.addPage);

  final _pages = [
    MyPage(
        key: Key('/default'),
        name: '/default',
        desc: '默认样例',
        builder: (context) => MyHomePage(
              title: 'default',
            )),
    MyPage(
        key: Key('/state'),
        name: '/state',
        desc: '状态样例',
        builder: (context) => SampleAppPage()),
    MyPage(
        key: Key('/fade'),
        name: '/fade',
        desc: 'fade动画',
        builder: (context) => FadeTest(
              title: 'fade demo',
            )),
    MyPage(
        key: Key('/signature'),
        name: '/signature',
        desc: '签字demo',
        builder: (context) => SignaturePage()),
    MyPage(
        key: Key('/async'),
        name: '/async',
        desc: 'async异步',
        builder: (context) => AsyncDemoPage()),
    MyPage(
        key: Key('/isolate'),
        name: '/isolate',
        desc: 'isolate测试',
        builder: (context) => IsolateDemoPage()),
    MyPage(
        key: Key('/lifecycle'),
        name: '/lifecycle',
        desc: 'lifecycle测试',
        builder: (context) => LifeCycle()),
    MyPage(
        key: Key('/linearlayout'),
        name: '/linearlayout',
        desc: 'linearlayout',
        builder: (context) => LinearLayoutTest()),
    MyPage(
        key: Key('/listview'),
        name: '/listview',
        desc: 'listview',
        builder: (context) => ListViewTest()),
    MyPage(
        key: Key('/animate_container'),
        name: '/animate_container',
        desc: '可变容器动画',
        builder: (context) => AnimateContainerDemo()),
    MyPage(
        key: Key('/draggable_card'),
        name: '/draggable_card',
        desc: '拖拽演示',
        builder: (context) => PhysicsCardDragDemo()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int pos) {
          return getRow(pos);
        },
        itemCount: _pages.length,
      ),
    );
  }

  Widget getRow(int pos) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
        child: Text('${_pages[pos].desc}'),
        onTap: () {
          setState(() {
            print('${_pages[pos].desc}');
            addPage(_pages[pos]);
          });
        },
      ),
    );
  }
}
