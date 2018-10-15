import 'package:flutter/material.dart';
import 'package:flutter_json/UserModel.dart';
import 'package:flutter_json/API.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new UserDataPage(),
    );
  }
}
class UserDataPage extends StatefulWidget {
  @override
  _UserDataPageState createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  var users = List<UsersModel>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        var resBody = json.decode(response.body);
        Iterable list = resBody['data'];
        users = list.map((model) => UsersModel.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        body:

        ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index].avatar),
              ),
                title: Text(users[index].first_name),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder : (context) => DetailsPage(users[index]))
                );
            }
            );

          },
        ));
  }
}
class DetailsPage extends StatelessWidget {

  final UsersModel usersModel;
  DetailsPage(this.usersModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(usersModel.first_name+" "+usersModel.last_name)
      ),
    );
  }
}
