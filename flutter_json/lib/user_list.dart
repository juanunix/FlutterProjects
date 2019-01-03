import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_json/API.dart';
import 'package:flutter_json/user_detail.dart';
import 'package:flutter_json/usermodel.dart';


class UserListPage extends StatefulWidget {
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {

    var users = List<UserModel>();
    _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        var resBody = json.decode(response.body);
        Iterable list = resBody['data'];
        users = list.map((model) => UserModel.fromJson(model)).toList();
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
       appBar: AppBar(title: Text('Flutter Json Demo'),),
       body: ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(

              leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index].avatar),
              ),
                title: Text(users[index].firstName,style: TextStyle(fontSize: 18.0),),
                trailing: Icon(Icons.navigate_next,color: Colors.black,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder : (context) => DetailsPage(users[index]))
                );
            }
            );

          }, separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              child: Divider(color: Colors.black,),
            );
          },
        ),
    );
  }
}