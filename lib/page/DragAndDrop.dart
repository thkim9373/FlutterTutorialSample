import 'dart:collection';

import 'package:flutter/material.dart';

class DragAndDrop extends StatefulWidget {
  @override
  _DragAndDropState createState() => _DragAndDropState();
}

class _DragAndDropState extends State<DragAndDrop> {
  Color emptyColor = Color.fromARGB(50, 123, 253, 255);
  Color itemColor = Color.fromRGBO(123, 253, 255, 1);

  Queue<int> draggable = Queue.from([1, 2, 3, 4, 5, 6, 7, 8, 9]);
  Queue<int> dragged = Queue();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            child: Center(
              child: Draggable<int>(
                data: draggable.first,
                child: DragBox(
                  draggable.first.toString(),
                  itemColor,
                ),
                feedback: DragBox(
                  draggable.first.toString(),
                  itemColor,
                ),
                childWhenDragging: DragBox(
                  "",
                  emptyColor,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Center(
            child: DragTarget<int>(
              builder: (context, candidateData, rejectedData) {
                return dragged.isEmpty ? DragBox("", emptyColor) : DragBox(dragged.first.toString(), itemColor);
              },
              onAccept: (int) {
                setState(() {
                  dragged.addFirst(draggable.removeFirst());
                  draggable.addLast(draggable.last + 1);
                });
                print("draggable : ${draggable.toString()}");
                print("dragged : ${dragged.toString()}");
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DragBox extends StatelessWidget {
  final String num;
  final Color color;

  const DragBox(
    this.num,
    this.color, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 100,
        height: 100,
        child: Center(
          child: Text(
            num,
            style: TextStyle(
              color: Colors.black,
              fontSize: 60,
            ),
          ),
        ),
        color: color,
      ),
    );
  }
}
