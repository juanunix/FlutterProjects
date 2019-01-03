import 'package:flutter/material.dart';
import 'package:flutter_json/user_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter User Profile',
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home:  UserListPage(),
    );
  }
}