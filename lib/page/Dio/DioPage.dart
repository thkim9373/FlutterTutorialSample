import 'package:flutter/material.dart';
import 'package:flutter_tutorial_sample/page/Dio/DioServer.dart';

class Dio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            server.getReq();
          },
          child: Text("GET"),
          color: Colors.orangeAccent,
        ),
        FlatButton(
          onPressed: () {
            server.postReq();
          },
          child: Text("POST"),
          color: Colors.orangeAccent,
        ),
        FlatButton(
          onPressed: () {
            server.getReqWzQuery();
          },
          child: Text("GET WITH QUERY"),
          color: Colors.orangeAccent,
        ),
      ],
    );
  }
}

Server server = Server();
