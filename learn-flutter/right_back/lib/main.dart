import 'package:flutter/material.dart';

import 'first_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cupertino page route',
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
