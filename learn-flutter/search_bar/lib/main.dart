import 'package:flutter/material.dart';
import 'package:search_bar/search_bar.dart';

import 'search_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'searchbar demo',
      theme: ThemeData.light(),
      home: SearchBar(),
    );
  }
}
