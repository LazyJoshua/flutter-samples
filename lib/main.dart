import 'dart:async';

import 'package:flutter/material.dart';

import 'pages/root_app.dart';

void main() {
  runApp(RootApp());
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print("=============");
    describe();
    print("=============");
  }
}

class MyDescribable extends Describable {
  @override
  void describe() {
    // TODO: implement describe
  }
}

const oneSecond = Duration(seconds: 1);

Future<void> printWithDelay(String msg) {
  return Future.delayed(oneSecond).then((value) => print(msg));
}
