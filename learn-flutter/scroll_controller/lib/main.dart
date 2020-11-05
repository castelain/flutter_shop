import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ScrollView Demo'),
        ),
        body: MyApp(),
      ),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showBtn = false;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    showBtn = false;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 1000) {
        setState(() {
          showBtn = true;
        });
      } else {
        setState(() {
          showBtn = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RaisedButton(
            onPressed: showBtn
                ? () {
                    _scrollController.animateTo(0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease);
                  }
                : null,
            child: Text('Back to Top'),
          ),
          Expanded(
            child: ListView.separated(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('list ${index + 1}'),
                  );
                },
                separatorBuilder: (context, index) {
                  return index % 2 == 0
                      ? Divider(
                          color: Colors.redAccent,
                        )
                      : Divider(
                          color: Colors.blueAccent,
                        );
                },
                itemCount: 30),
          ),
        ],
      ),
    );
  }
}
