import 'package:flutter/material.dart';

import 'counter_page.dart';

class KeepState extends StatefulWidget {
  @override
  _KeepStateState createState() => _KeepStateState();
}

class _KeepStateState extends State<KeepState>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('keep state'),
        bottom: TabBar(
          controller: _controller,
          tabs: [Icon(Icons.home), Icon(Icons.email), Icon(Icons.access_alarm)],
        ),
      ),
      body: Center(
        child: TabBarView(
          controller: _controller,
          children: [CounterPage(), CounterPage(), CounterPage()],
        ),
      ),
    );
  }
}
