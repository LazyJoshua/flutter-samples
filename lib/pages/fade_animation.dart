import 'package:flutter/material.dart';

class FadeTest extends StatefulWidget {
  FadeTest({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _FadeTestState createState() => _FadeTestState();
}

class _FadeTestState extends State<FadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curvedAnimation;
  FlutterLogo flutterLogo;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    flutterLogo = FlutterLogo(
      size: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curvedAnimation,
            child: FlutterLogo(
              size: 100,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.play_arrow),
        onPressed: () {
          controller.reset();
          controller.forward();
          // controller.reverse();
        },
      ),
    );
  }
}
