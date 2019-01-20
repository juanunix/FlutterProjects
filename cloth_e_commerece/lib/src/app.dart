import 'package:cloth_e_commerece/src/ui/home_page.dart';
import 'package:flutter/material.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.red,
        primaryColor: Colors.white
      ),
      home: HomePage(),
    );
  }
}

