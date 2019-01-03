import 'package:flutter/material.dart';
import 'package:flutter_json/usermodel.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class DetailsPage extends StatefulWidget {
  final UserModel userModel;
  DetailsPage(this.userModel);
  @override
  DetailsPageState createState() {
    return new DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(),
                  image: DecorationImage(
                      image: NetworkImage(widget.userModel.avatar),
                      fit: BoxFit.cover)),
            ),
          ),
          Text(
            widget.userModel.firstName + " " + widget.userModel.lastName,
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Flutter Developer',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Platform.isAndroid
              ? RaisedButton(
                  shape: new RoundedRectangleBorder(
                      //borderRadius: new BorderRadius.circular(30.0)
                      ),
                  onPressed: () {},
                  child: Text(
                    'Follow',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  color: Colors.black,
                )
              : CupertinoButton(
                  //borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black,
                  child: Text(
                    'Follow',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  onPressed: () {},
                ),
          SizedBox(
            height: 10.0,
          ),
          showSwitch()
        ],
      ),
    );
  }

  bool isTrue = false;
  Widget showSwitch() {
    return Platform.isAndroid
        ? SwitchListTile(
          activeColor: Colors.yellow,
            title: Text(' Has ios knowledge'),
            onChanged: (bool value) {
              isTrue = !isTrue;
              setState(() {});
            },
            value: isTrue,
          )
        : 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(' Has ios knowledge?'),
            CupertinoSwitch(
            activeColor: Colors.yellow,
            onChanged: (bool value) {
              isTrue = !isTrue;
              setState(() {});
            },
            value: isTrue,
          )
          ],
        );
        
  }
}
