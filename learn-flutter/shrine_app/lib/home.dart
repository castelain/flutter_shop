import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.menu,
                semanticLabel: 'menu',
              ),
              onPressed: () {
                print('Menu button');
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  semanticLabel: 'search',
                ),
                onPressed: () {
                  print('search');
                }),
            IconButton(
                icon: Icon(Icons.tune, semanticLabel: 'filter'),
                onPressed: () {
                  print('filter');
                })
          ],
          title: Text('SHRINE'),
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            children: _buildGridCards(11),
          ),
        ));
  }

  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
        count,
        (int index) => Card(
            elevation: 1.0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset(
                      'assets/${index + 1}.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('Title'),
                          SizedBox(height: 8.0),
                          Text('Secondary Text'),
                        ]),
                  )
                ])));

    return cards;
  }
}
