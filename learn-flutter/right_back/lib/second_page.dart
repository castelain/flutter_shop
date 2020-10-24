import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.deepPurpleAccent,
          child: Tooltip(
            message: 'This is a tooltip...',
            child: Text(
              'right slide for back first page',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
