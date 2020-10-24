import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'base widgets',
      home: Scaffold(
       appBar: AppBar(
         title: Text(
           'base widget',
         ),
       ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.fromLTRB(30, 20, 0, 0),
            width: 400,
            height: 200,
            // color: Colors.lightBlue,
            decoration: BoxDecoration(
              border: Border.all(
                width: 4,
                color: Colors.purple,
              ),
              gradient: LinearGradient(
                colors: [Colors.amber, Colors.lightGreenAccent, Colors.lightGreen]
              )
            ),
            child: Text(
              'A very very very very very very very very very very very very  long text in container',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 40,
                color: Colors.deepPurpleAccent,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted
              ),
            ),
          ),
        ),
      )
    );
  }
}