import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage>
    with AutomaticKeepAliveClientMixin {
  int _count;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('点一下加 1'),
            Text(
              '$_count',
              style: TextStyle(fontSize: 40.0),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: '点一下加 1',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            this._count++;
          });
        },
      ),
    );
  }
}
