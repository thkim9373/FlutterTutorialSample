import 'package:flutter/material.dart';

class Switches extends StatefulWidget {
  @override
  _SwitchesState createState() => _SwitchesState();
}

class _SwitchesState extends State<Switches> {
  bool _onOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Switch(
              value: _onOff,
              onChanged: (newOnOff) => _changeState(newOnOff),
            )
          ],
        ),
      ),
    );
  }

  _changeState(bool newOnOff) {
    setState(() {
      _onOff = newOnOff;
    });
  }
}
