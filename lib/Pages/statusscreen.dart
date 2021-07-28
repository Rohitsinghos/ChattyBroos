import 'package:firebase_app/models/chatmodel.dart';
import 'package:firebase_app/models/groupchatModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_app/Pages/groopChatRoom.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

class StatusScreen extends StatefulWidget {
  final int adminInt;
  StatusScreen({this.adminInt});
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {

  Icon okk = Icon(
    Icons.person_add,
    color: Colors.white,
  );
  int op = 0;
  void nothing() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: groupData.length,
        itemBuilder: (context, i) => GestureDetector(
          onTap: () {

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => groupChatRoom(
                        name: groupData[i],
                        admin: dummyData[widget.adminInt].name,
                        adminInt: widget.adminInt,
                      )));

          },
          child: Padding(
            padding: (i+1!=groupData.length)? EdgeInsets.all(0.0):EdgeInsets.only(bottom:70.0),
            child: new Column(
              children: <Widget>[
                (widget.adminInt!=i)?new ListTile(
                  leading: new CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(groupData[i].awatarUrl),
                  ),
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Text(
                            groupData[i].name,
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new Text(
                        groupData[i].time,
                        style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                      )
                    ],
                  ),
                  subtitle: new Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      (groupData[i].message.length<30)?groupData[i].message:'so long about',
                      style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                  ),
                ):Container(child: null,),
                if (widget.adminInt != i && groupData.length-1 != i)
                  new Divider(
                    height: 10.0,
                  ),

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.group_add),
        onPressed: () {

        },
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
