import 'package:flutter/material.dart';

const String _name = "jasmine";

void main() {
  runApp(FriendlyChart());
}

class FriendlyChart extends StatelessWidget {
  const FriendlyChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FriendlyChart App',
      home: ChartScreen(),
    );
  }
}

class ChartScreen extends StatefulWidget {
  ChartScreen({Key key}) : super(key: key);

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class ChartMessage extends StatelessWidget {
  ChartMessage({Key key, this.text, this.animationController})
      : super(key: key);

  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(curve: Curves.easeInOut, parent: animationController),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    child: Text(_name[0]),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_name, style: Theme.of(context).textTheme.subhead),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  )
                ],
              ),
            ]),
      ),
    );
  }
}

class _ChartScreenState extends State<ChartScreen>
    with TickerProviderStateMixin {
  final List<ChartMessage> _messages = <ChartMessage>[];
  final TextEditingController _textEditingController = TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FriendlyChart App'),
        ),
        body: Column(children: <Widget>[
          Flexible(
              child: ListView.builder(
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
            padding: const EdgeInsets.all(8.0),
            reverse: true,
          )),
          Divider(
            height: 1,
          ),
          Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer())
        ]));
  }

  @override
  void dispose() {
    for (ChartMessage message in _messages) {
      message.animationController.dispose();
      super.dispose();
    }
  }

  Widget _buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(children: <Widget>[
            Flexible(
                child: TextField(
              controller: _textEditingController,
              onSubmitted: _isComposing ? _handleSubmit : null,
              onChanged: (String str) =>
                  setState(() => _isComposing = str.isNotEmpty),
              decoration: InputDecoration.collapsed(hintText: 'Send a message'),
            )),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _isComposing
                        ? _handleSubmit(_textEditingController.text)
                        : null))
          ]),
        ));
  }

  void _handleSubmit(String str) {
    ChartMessage message = ChartMessage(
      text: str,
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    _textEditingController.clear();
    setState(() {
      _messages.insert(0, message);
      _isComposing = false;
    });
    message.animationController.forward();
  }
}
