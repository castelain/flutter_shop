import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'image demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('image-demo')
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 200,
            color: Colors.lightGreen,
            child: Image.network(
              'https://ftp.bmp.ovh/imgs/2020/10/99d3189fc110cafc.png',
              fit: BoxFit.contain,
              repeat: ImageRepeat.noRepeat,
              color: Colors.purple,
              colorBlendMode: BlendMode.darken,
            ),
          )
        ),
      ),
    );
  }
}