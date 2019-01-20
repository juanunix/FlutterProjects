import 'package:flutter/material.dart';
import 'package:flutter_team_list/flutter_team_model.dart';

class FlutterTeamDetail extends StatefulWidget {
  final FlutterTeamModel model;

  const FlutterTeamDetail({Key key, this.model}) : super(key: key);

  _FlutterTeamDetailState createState() => _FlutterTeamDetailState();
}

class _FlutterTeamDetailState extends State<FlutterTeamDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
              backgroundColor: Colors.grey[200],

      ),
      body: Stack(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 120.0, left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
          color: Colors.grey,
          blurRadius: 5.0,
          offset: Offset(5.0, 5.0),
          spreadRadius: 5.0)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    widget.model.name,
                    style: TextStyle(fontSize: 25.0),
                  ),
                  RichText(
                    text: TextSpan(
          children: [
            TextSpan(
                text: widget.model.position,
                style:
                    TextStyle(color: Colors.black, fontSize: 14.0)),
            TextSpan(
                text: ' @${widget.model.address}',
                style: TextStyle(color: Colors.blue, fontSize: 14.0)),
          ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    width: 90.0,
                    height: 2.0,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
          Icon(Icons.shop_two),
          SizedBox(
            width: 10.0,
          ),
          Icon(Icons.add_a_photo),
          SizedBox(
            width: 10.0,
          ),
          Icon(Icons.cake)
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
          child: Text(
            'Flutter - Sky is Limit! \nFlutter Features : Fast Development, Expressive and Flexible UI, Native Performance',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
          ButtonTheme(
            minWidth: 110.0,
            height: 40.0,
            child: new RaisedButton(
                child: new Text(
                  "Chat",
                  style:
                      TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onPressed: () {},
                color: Colors.blue,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0))),
          ),
          SizedBox(
            width: 20.0,
          ),
          ButtonTheme(
            minWidth: 110.0,
            height: 40.0,
            child: new RaisedButton(
                color: Colors.blue,
                child: new Text(
                  "Say Thanks!",
                  style:
                      TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0))),
          )
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
           Padding(
            padding: const EdgeInsets.only(top :50.0),
            child: Align(
              alignment:Alignment.topCenter,
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 10.0),
                    borderRadius: BorderRadius.circular(50.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    widget.model.image,
                    width: 60.0,
                    height: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
