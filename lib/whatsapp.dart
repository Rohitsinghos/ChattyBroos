
import 'package:firebase_app/Pages/chats.dart';
import 'package:firebase_app/Pages/profileScreen.dart';
import 'package:firebase_app/Pages/statusscreen.dart';
import 'package:firebase_app/signInScreen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';


class whatsApp extends StatefulWidget {
  final int admin;

  whatsApp({this.admin});
  @override
  _whatsAppState createState() => _whatsAppState();
}

// ignore: camel_case_types
class _whatsAppState extends State<whatsApp>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final userData=GetStorage();

  int admin=0;

  @override
  void initState() {
    admin= userData.read('admini');

    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
  }

  void nothing() {
      Navigator.pop(context);
    setState(() {});
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
        title: new Text("ChattyBuddies"),
        elevation: 1.0,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(text: "MESSAGES"),
            new Tab(
              text: "GROUPS",
            ),
            new Tab(
              text: "PROFILE",
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new IconButton(
              onPressed: (){
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Download more Apps And More!"),
                          ),),
                        content: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[

                                  RaisedButton(
                                    onPressed: (){
                                      launch('https://www.techsickcommunity.tech');
                                    },
                                    child: Text('Ts QuizApp',style: TextStyle(color: Colors.white,fontSize: 16),),
                                    color: Colors.blue,

                                  ),

                                  RaisedButton(
                                    onPressed: (){
                                      launch('https://www.techsickcommunity.tech');
                                    },
                                    child: Text('Tecksick App',style: TextStyle(color: Colors.white,fontSize: 16),),
                                    color: Colors.blue,

                                  ),

                                  RaisedButton(
                                    onPressed: (){
                                      launch('https://www.techsickcommunity.tech');
                                    },
                                    child: Text('Ts TicTocToe Game',style: TextStyle(color: Colors.white,fontSize: 16),),
                                    color: Colors.blue,

                                  ),

                                  RaisedButton(
                                    onPressed: (){
                                      launch('https://www.techsickcommunity.tech/techsick_community/aboutus.php');
                                    },
                                    child: Text('Know More - About Us',style: TextStyle(color: Colors.white,fontSize: 16),),
                                    color: Colors.blue,

                                  ),

                                  RaisedButton(
                                    onPressed: (){
                                      launch('https://www.techsickcommunity.tech');
                                    },
                                    child: Text('Visit Website',style: TextStyle(color: Colors.white,fontSize: 16),),
                                    color: Colors.blue,

                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(top:30.0),
                                    child: RaisedButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                        setState(() {   });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text('Back',style: TextStyle(color: Colors.white,fontSize: 18),),
                                      ),
                                      color: Colors.blue,

                                    ),
                                  ),

                                ],
                              ),
                            )),
                      );
                    });
              },
              icon: Icon(Icons.view_carousel),
            ),
          )
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new ChatScreen(adminInt: widget.admin,),
          new StatusScreen(adminInt: widget.admin,),
          new ProfilePage(adminBe: widget.admin,),
        ],
      ),
    );
  }
}
