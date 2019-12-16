import 'dart:convert';

import 'package:flutter/material.dart';

class Json extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String JsonString = '{"name" : "John Smith", "email" : "John@example.com", "created_time" : 321123321123}';

    Map<String, dynamic> userMap = jsonDecode(JsonString);

    var user = User.fromJson(userMap);

    return Scaffold(
      body: Center(
        child: Text(
          "name: ${user.name} \n"
          "email: ${user.email} \n"
          "created_time: ${user.createdTime} \n\n",
          textScaleFactor: 2,
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final int createdTime;

  User(this.name, this.email, this.createdTime);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        createdTime = json['created_time'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'createdTime': createdTime,
      };
}
