import 'package:flutter/material.dart';
import './home.dart';
import './colors.dart';

void main() => runApp(MyApp());

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(accentColor: color),
      child: child,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  ThemeData _buildThemeData() {
    ThemeData base = ThemeData.light();
    return base.copyWith(
      accentColor: kShrineBrown900,
      primaryColor: kShrinePink100,
      buttonColor: kShrinePink100,
      scaffoldBackgroundColor: kShrineSurfaceWhite,
      cardColor: kShrineSurfaceWhite,
      textSelectionColor: kShrinePink100,
      errorColor: kShrineErrorRed,
      primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => Home()
      },
      theme: _buildThemeData(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 200.0,
                height: 200.0,
                child: Image.asset('assets/robot.png')),
            Text('SHRINE'),
            SizedBox(
              height: 16.0,
            ),
            AccentColorOverride(
                color: kShrineBrown900,
                child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      // filled: true,
                      labelText: 'Username',
                    ))),
            SizedBox(
              height: 8.0,
            ),
            AccentColorOverride(
                color: kShrineBrown900,
                child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        // filled: true,
                        labelText: 'Password'))),
            ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                    child: Text('Cancel'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/home');
                    },
                    elevation: 8.0,
                    child: Text('Next'),
                  )
                ])
          ]),
    ));
  }
}
