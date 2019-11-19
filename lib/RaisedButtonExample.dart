import 'package:flutter/material.dart';

class RaisedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Raised Button")),
        body: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 12
                ),
                child: RaisedButton(
                  onPressed: () {
                    print("Button clicked!!!");
                  },
                  child: Text("Button"),
                  color: Colors.cyanAccent,
                  splashColor: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
