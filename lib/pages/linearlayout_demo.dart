import 'package:flutter/material.dart';

class LinearLayoutTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('linearlayout test'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text('row one'),
            Text('row two'),
            Text('row three'),
            Text('row four'),
          ],
        ),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text('column one'),
      //     Text('column two'),
      //     Text('column three'),
      //     Text('column four'),
      //   ],
      // ),
      // body: ListView(
      //   children: <Widget>[
      //     Text('Row One'),
      //     Text('Row Two'),
      //     Text('Row Three'),
      //     Text('Row Four'),
      //   ],
      // ),
    );
  }
}
