import 'package:flutter/material.dart';
import 'package:flutter_team_list/flutter_team_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primarySwatch: Colors.blue,
        primaryColor: Colors.white
      ),
      home:
      FlutterTeamListPage(),
    );
  }
}

