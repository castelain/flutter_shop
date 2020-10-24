import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp(List<String>.generate(100, (index) => 'item $index')));

class MyApp extends StatelessWidget{
  final List<String> items;

  MyApp(this.items);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'listView widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'listView widget'
          ),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  color: Colors.lightGreen,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Center(
                    child: Text('${items[index]}'),
                  ),
                );
              }
          )
        ),
      ),
    );
  }
}