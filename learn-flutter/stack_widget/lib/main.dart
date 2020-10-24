import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget stack = Stack(
    // alignment: AlignmentDirectional.bottomCenter,
    children: <Widget>[
      CircleAvatar(
        radius: 100.0,
        backgroundColor: Colors.lightBlueAccent,
        child: Image.network(
            'https://ftp.bmp.ovh/imgs/2020/10/99d3189fc110cafc.png'),
      ),
      Positioned(
        top: 50,
        left: 80,
        child: Container(
          child: Text('molly'),
          color: Colors.amberAccent,
        ),
      ),
      Positioned(
        bottom: 50,
        right: 60,
        child: Container(
          child: Text('dddddddddd'),
          color: Colors.amberAccent,
        ),
      )
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            body: Center(
          child: Card(
            child: stack,
          )
        )));
  }
}
