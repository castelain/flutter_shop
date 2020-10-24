import 'package:flutter/material.dart';

import 'bottom_app_app_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bottom app bar',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: BottomAppBarWidget(),
    );
  }
}
