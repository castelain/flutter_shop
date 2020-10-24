import 'package:flutter/material.dart';

import 'clip_path.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'clip path',
      debugShowCheckedModeBanner: false,
      home: ClipPathDemo(),
    );
  }
}
