import 'package:flutter/material.dart';
import 'package:flutter_tutorial_sample/page/Dio/DioPage.dart';
import 'package:flutter_tutorial_sample/page/DragAndDrop.dart';
import 'package:flutter_tutorial_sample/page/Email.dart';
import 'package:flutter_tutorial_sample/page/RaisedButtonExample.dart';
import 'package:flutter_tutorial_sample/page/switch.dart';

void main() => runApp(MyFormApp());

class MyFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Form'),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildExpand(Text("Go Text Form Field Example"), context, EmailWidget()),
        _buildExpand(Text("Go Raised Button Example"), context, RaisedButtonExample()),
        _buildExpand(Text("Go Switch Example"), context, Switches()),
        _buildExpand(Text("Go Drag And Drop Example"), context, DragAndDrop()),
        _buildExpand(Text("Go Dio Example"), context, Dio()),
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  Widget _buildExpand(Text text, BuildContext context, Widget target) => Padding(
        padding: EdgeInsets.all(8),
        child: RaisedButton(
          child: text,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => target));
          },
          color: Colors.purple[200],
          splashColor: Colors.amber,
          hoverColor: Colors.pink,
        ),
      );
}
