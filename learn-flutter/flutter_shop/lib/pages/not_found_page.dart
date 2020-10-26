import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: Container(
        child: Center(
          child: Text('页面走丢啦...'),
        ),
      ),
    );
  }
}
