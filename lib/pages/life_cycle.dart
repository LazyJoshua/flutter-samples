import 'package:flutter/material.dart';

class LifeCycle extends StatefulWidget {
  @override
  _LifeCycleState createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> with WidgetsBindingObserver {
  AppLifecycleState _appLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _appLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_appLifecycleState == null) {
      return _getView(Text(
        'This widget has not observed any lifecycle changes.',
        textDirection: TextDirection.ltr,
      ));
    }
    return _getView(Text(
      'The most recent lifecycle state this widget observed was: $_appLifecycleState.',
      textDirection: TextDirection.ltr,
    ));
  }

  StatefulWidget _getView(Text text) {
    return Scaffold(
      body: Center(
        child: text,
      ),
    );
  }
}
