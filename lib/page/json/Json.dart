import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_sample/page/json/User.dart';

class Json extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String jsonString =
        '{"name" : "John Smith", "email" : "John@example.com", "created_time" : 321123321123, "address":{"street":"victor street", "city":"best city"}}';

    Map<String, dynamic> userMap = jsonDecode(jsonString);

    var user = User.fromJson(userMap);
    var jsonData = user.toJson();

    return Scaffold(
      body: Center(
        child: Text(
          "name: ${user.name} \n"
          "email: ${user.email} \n"
          "created_time: ${user.createdTime} \n\n"
          ""
          "toJson: $jsonData",
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
