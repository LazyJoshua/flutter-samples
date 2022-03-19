
import 'package:flutter/material.dart';
import 'package:sample_app/pages/animate_containier.dart';
import 'package:sample_app/pages/async_demo.dart';
import 'package:sample_app/pages/default_example.dart';
import 'package:sample_app/pages/draggable_card.dart';
import 'package:sample_app/pages/fade_animation.dart';
import 'package:sample_app/pages/isolate_demo.dart';
import 'package:sample_app/pages/life_cycle.dart';
import 'package:sample_app/pages/linearlayout_demo.dart';
import 'package:sample_app/pages/list_view_demo.dart';
import 'package:sample_app/pages/state_example.dart';

import 'home_page.dart';
import 'signature_example.dart';

class RootApp extends StatefulWidget {
  RootApp({Key key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  void initState() {
    super.initState();
    print('root app init state');
  }

  @override
  Widget build(BuildContext context) {
    print('root app build');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/default': (context) => MyHomePage(
              title: 'default',
            ),
        '/state': (context) => SampleAppPage(),
        '/fade': (context) => FadeTest(),
        '/signature': (context) => SignaturePage(),
        '/async': (context) => AsyncDemoPage(),
        '/isolate': (context) => IsolateDemoPage(),
        '/lifecycle': (context) => LifeCycle(),
        '/linearlayout': (context) => LinearLayoutTest(),
        '/listview': (context) => ListViewTest(),
        '/animate_container': (context) => AnimateContainerDemo(),
        '/draggable_card': (context) => PhysicsCardDragDemo(),
      },
    );
  }
}
