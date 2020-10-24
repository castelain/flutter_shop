import 'package:flutter/material.dart';

class ScreenArgument {
  final String title;
  final String msg;

  ScreenArgument(this.title, this.msg);
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);
  _launchAndWaitReturn(BuildContext context) async {
    final response = await Navigator.pushNamed(context, '/second',
        arguments: ScreenArgument('return title', 'return msg'));

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text('$response'),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('route page-1')),
        body: Builder(builder: (BuildContext context) {
          return Column(children: <Widget>[
            RaisedButton(
              child: Text('go to the new page'),
              onPressed: () {
                _launchAndWaitReturn(context);
              },
            ),
          ]);
        }));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenArgument args = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('route page-2'),
          ),
          body: Center(
              child: Column(children: [
            Text(
              args.title,
              style: TextStyle(fontSize: 18),
            ),
            Text(args.msg),
            RaisedButton(
              child: Text('go back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            RaisedButton(
                child: Text('return yes'),
                onPressed: () {
                  Navigator.pop(context, 'yes');
                }),
            RaisedButton(
                child: Text('return no'),
                onPressed: () {
                  Navigator.pop(context, 'no');
                })
          ]))),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'route demo-1',
    initialRoute: '/',
    routes: {
      '/': (context) => FirstPage(),
      '/second': (context) => SecondPage(),
    },
  ));
}
