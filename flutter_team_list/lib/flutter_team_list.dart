import 'package:flutter/material.dart';
import 'package:flutter_team_list/flutter_team_detail.dart';
import 'package:flutter_team_list/flutter_team_model.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterTeamListPage extends StatefulWidget {
  _FlutterTeamListPageState createState() => _FlutterTeamListPageState();
}

class _FlutterTeamListPageState extends State<FlutterTeamListPage> {
  List<FlutterTeamModel> list;
  @override
    void initState() {
      list = FlutterTeamModel.getFlutterTeamList();
      super.initState();
    }
 _launchURL() async {
    const url = 'https://www.facebook.com/groups/392934177836346';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Flutter Team'),
        actions: <Widget>[
          
          Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border.all(),
            shape: BoxShape.circle
          ),
            child: IconButton(icon :Icon(Icons.touch_app,), color: Colors.black, onPressed: () {
              _launchURL();
            },),
          )],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>FlutterTeamDetail(model:list[index])));
            },
              child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              height: 150.0,
              alignment: FractionalOffset.center,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(10.0, 5.0),
                            spreadRadius: 0.0)
                      ],
                    ),
                    height: 120.0,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 25.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left:80.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(list[index].name),
                          SizedBox(
                            height: 5.0,
                          ),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                              new TextSpan(
                                  text: list[index].position,
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)
                                      ),
                              new TextSpan(
                                  text: '  @${list[index].address}',
                                  style: TextStyle(color: Colors.blue)),
                            ]),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 50.0,
                            height: 2.0,
                            decoration: BoxDecoration(color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(children: <Widget>[
                            
                            Icon(Icons.shop_two),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(Icons.shop_two),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(Icons.shop_two)
                          ],)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    top: 20.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey[200], width: 10.0),
                          borderRadius: BorderRadius.circular(50.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.network(
                          list[index].image,
                          width: 60.0,
                          height: 60.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
