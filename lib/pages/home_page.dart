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

typedef AddPage = void Function(MyPage page);

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

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
            Navigator.pushNamed(context, _pages[pos].name);
          });
        },
      ),
    );
  }
}
