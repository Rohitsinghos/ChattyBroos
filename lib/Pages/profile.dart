import 'package:firebase_app/models/chatmodel.dart';
import 'package:flutter/material.dart';

class ProfilePicPage extends StatefulWidget {
  final int adminBe;
  ProfilePicPage({this.adminBe});
  @override
  _ProfilePicPageState createState() => _ProfilePicPageState();
}

class _ProfilePicPageState extends State<ProfilePicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ChattyBuddies'),
      ),
      body:  Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: new CircleAvatar(
                      maxRadius: 90,
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage(dummyData[widget.adminBe].awatarUrl),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:20.0,bottom: 10),
                    child: new Text(
                      'Name - '+dummyData[widget.adminBe].name,
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'About - '+dummyData[widget.adminBe].message,
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Phone Number - '+dummyData[widget.adminBe].number,
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Status - Online',
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Join Date - '+dummyData[widget.adminBe].joinDate,
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),

                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Birthdate -  00-00-0000',
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),

                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Work - Student',
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),

                ],
              ),
            ),
          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
