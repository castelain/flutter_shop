import 'package:flutter/material.dart';

import 'keep_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Keep State', home: KeepState());
  }
}
