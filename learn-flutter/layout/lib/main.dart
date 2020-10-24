import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'row widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('row and column widget'),
        ),
        body: Row(
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              color: Colors.lightGreen,
              child: Text('a'),
            ),
            Expanded(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.purple,
                child: Text('b'),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.amber,
              child: Text('c'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('aaaaaaaaaa'),
                Text('bbbbbbbbbbbbbbbbbbbbbb'),
                Text('cccccccccccccccccc')
              ],
            )
          ],
        ),
      ),
    );
  }
}
