import 'package:flutter/material.dart';

import 'draggable_widget.dart';

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  Color _acceptedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('draggable demo'),
      ),
      body: Stack(
        children: [
          DraggableWidget(Offset(20, 50), Colors.lightBlue),
          DraggableWidget(Offset(150, 50), Colors.green),
          Center(
            child: DragTarget(
              onAccept: (Color color) {
                this._acceptedColor = color;
              },
              builder: (context, list1, list2) {
                return Container(
                  width: 230,
                  height: 230,
                  color: this._acceptedColor,
                  child: Center(
                    child: Text(
                      'Drag box in there!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
