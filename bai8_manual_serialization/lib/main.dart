import 'dart:convert';

import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  String jsonString = '{"name":"John Smith","email":"John@gmail.com"}';
  Map<String, dynamic> userMap = jsonDecode(jsonString);
  var user = User.fromJson(userMap);
  String json = jsonEncode(user);

  print('Hello: ${user.name}');
  print('Email: ${user.email}');
  print(json);
}
