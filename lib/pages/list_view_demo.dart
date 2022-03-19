import 'package:flutter/material.dart';

class ListViewTest extends StatefulWidget {
  @override
  _ListViewTestState createState() => _ListViewTestState();
}

class _ListViewTestState extends State<ListViewTest> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list view demo'),
      ),
      body: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          }),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
        child: Text('Row $i'),
        onTap: () {
          setState(() {
            widgets.add(getRow(widgets.length));
            print('row $i');
          });
        },
      ),
    );

    // return GestureDetector(
    //   child: Text('Row $i'),
    //   onTap: () {
    //     setState(() {
    //       widgets.add(getRow(widgets.length));
    //       print('Row $i');
    //     });
    //   },
    // );
  }
}
