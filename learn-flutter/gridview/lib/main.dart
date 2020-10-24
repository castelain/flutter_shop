import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid View',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid View'),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Image.network('https://ftp.bmp.ovh/imgs/2020/10/2e8956632d1519da.png'),
            Image.network('https://ftp.bmp.ovh/imgs/2020/10/1454263b626e95a2.png'),
            Image.network('https://ftp.bmp.ovh/imgs/2020/10/580e3b9a0d9edfc6.png'),
            Image.network('https://ftp.bmp.ovh/imgs/2020/10/ce1815de6b398925.png'),
            Image.network('https://ftp.bmp.ovh/imgs/2020/10/024397bcd6a11283.png'),
            Image.network('https://ftp.bmp.ovh/imgs/2020/10/8e9c760853f5bfd2.png'),
            Image.network('https://ftp.bmp.ovh/imgs/2020/10/bfd56e50793f952c.png'),
          ],
        ),
      ),
    );
  }
}