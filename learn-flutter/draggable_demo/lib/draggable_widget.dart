import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DraggableWidget extends StatefulWidget {
  Offset _offset;
  Color _color;

  DraggableWidget(this._offset, this._color);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset _offset = Offset(0, 0);

  @override
  void initState() {
    super.initState();
    _offset = widget._offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: _offset.dx,
        top: _offset.dy,
        child: Draggable(
          data: widget._color,
          feedback: Container(
            width: 100,
            height: 100,
            color: widget._color.withOpacity(0.5),
          ),
          child: Container(
            width: 110,
            height: 110,
            color: widget._color,
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              this._offset = offset;
            });
          },
        ));
  }
}
