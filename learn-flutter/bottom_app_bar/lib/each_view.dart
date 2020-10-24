import 'package:flutter/material.dart';

class EachView extends StatelessWidget {
  final String title;

  EachView(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$title',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text('$title'),
      ),
    );
  }
}
