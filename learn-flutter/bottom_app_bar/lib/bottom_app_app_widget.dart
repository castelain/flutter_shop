import 'package:flutter/material.dart';

import 'each_view.dart';

class BottomAppBarWidget extends StatefulWidget {
  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  List<EachView> views = List();
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    views..add(EachView('Home'))..add(EachView('Email'));
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[_currentIndex],
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add a new page',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EachView('New page');
          }));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.lightBlue,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                tooltip: 'Home',
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                }),
            IconButton(
                icon: Icon(Icons.email),
                color: Colors.white,
                tooltip: 'Email',
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                })
          ],
        ),
      ),
    );
  }
}
