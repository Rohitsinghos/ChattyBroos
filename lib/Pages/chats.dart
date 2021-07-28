import 'package:firebase_app/Pages/chatroom.dart';
import 'package:firebase_app/Pages/contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/models/chatmodel.dart';
import 'dart:ui';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatScreen extends StatefulWidget {
  final int adminInt;
  ChatScreen({this.adminInt});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final userData=GetStorage();

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

  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
      await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, i) => GestureDetector(
          onTap: () {

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChatRoom(
                            name: dummyData[i],
                            admin: dummyData[widget.adminInt].name,
                            otherInt: i,
                          )));

          },
          child: Padding(
              padding: (i+1!=dummyData.length)? EdgeInsets.all(0.0):EdgeInsets.only(bottom:70.0),
            child: new Column(
              children: <Widget>[
            (widget.adminInt!=i && userData.read('userNumber') != dummyData[i].number)?new ListTile(
                  leading: new CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(dummyData[i].awatarUrl),
                  ),
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                         children: <Widget>[
                           new Text(
                             dummyData[i].name,
                             style: new TextStyle(fontWeight: FontWeight.bold),
                           ),
                           dummyData[i].isOnline ?
                           Container(
                             margin: const EdgeInsets.only(left: 5),
                             width: 7,
                             height: 7,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: Colors.green
                             ),
                           )
                           : Container(
                             margin: const EdgeInsets.only(left: 5),
                             width: 7,
                             height: 7,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: Colors.red,
                             ),
                           ),
                         ],
                      ),
                      new Text(
                        dummyData[i].time,
                        style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                      )
                    ],
                  ),
                  subtitle: new Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      (dummyData[i].message.length<30)?dummyData[i].message:'so long about',
                      style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                  ),
                ):Container(child: null,),
                if (widget.adminInt != i  && dummyData.length-1 != i &&(widget.adminInt!=10 || dummyData.length-2 != i))
                  new Divider(
                    height: 10.0,
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: okk,
        onPressed: () async {
          final PermissionStatus permissionStatus = await _getPermission();
          if (permissionStatus == PermissionStatus.granted) {
            Navigator.of(context).push( MaterialPageRoute(
                builder:
                    (context) => ContactsPage()
            ));
          }
          else{
            return showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                      title: Text("Permission denied!"),
                      content: Stack(
                        children: <Widget>[
                          Text("Please goto settings and give permissions to this apk! to access further!"),
                          Padding(
                            padding: const EdgeInsets.only(top:70.0),
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text("OK",style: TextStyle(color: Colors.white),),
                              color: Colors.blue,
                            ),
                          )
                        ],
                      )
                  );
                }
            );
          }
        },
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
