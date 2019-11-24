import 'package:flutter/material.dart';
import 'package:flutter_tutorial_sample/Email.dart';
import 'package:flutter_tutorial_sample/RaisedButtonExample.dart';
import 'package:flutter_tutorial_sample/switch.dart';

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
    return Column(children: <Widget>[
      _buildExpand(Text("Go Text Form Field Example"), context, EmailWidget()),
      _buildExpand(Text("Go Raised Button Example"), context, RaisedButtonExample()),
      _buildExpand(Text("Go Switch Example"), context, Switches()),
    ]);
  }

  Expanded _buildExpand(Text text, BuildContext context, Widget target) => Expanded(
        child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
            child: RaisedButton(
              child: text,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => target));
              },
              color: Colors.cyanAccent,
              splashColor: Colors.amber,
              hoverColor: Colors.pink,
            )),
      );
}
