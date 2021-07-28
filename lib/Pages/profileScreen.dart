import 'package:firebase_app/main.dart';
import 'package:firebase_app/models/chatmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_app/editProfile.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  final int adminBe;
  ProfilePage({this.adminBe});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userData = GetStorage();

  File _imageFile;
  bool _imgLoading=true;
  bool edited=false;
  bool loading=false;
  String _status="baba";
  int x;


  Future _openCamera() async{
    // ignore: deprecated_member_use
    final file = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgLoading=false;
      _imageFile=file;
      loading=true;
    });
  }

  Future _openGallery() async{
    // ignore: deprecated_member_use
    final file = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imgLoading=false;
      _imageFile=file;
      loading=true;
    });
  }

  _dialog(){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
              title: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Choose a way to get image!"),
                ),),
              content: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        _openCamera();
                        Navigator.pop(context);
                      },
                      child: Text('Camera'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: RaisedButton(
                        onPressed: (){
                          _openGallery();
                          Navigator.pop(context);
                        },
                        child: Text('Gallery'),
                      ),
                    )
                  ],
                ),
              )
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(top:40.0),
                     child:
                     CircleAvatar(
                       maxRadius: 90,
                        foregroundColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.grey,
                        backgroundImage: (!edited || _imageFile==null)?AssetImage(dummyData[widget.adminBe].awatarUrl):FileImage(_imageFile),

                      ),
                    ),
                   RaisedButton(
                     onPressed: (){ _dialog();
                        edited=true;
                     },
                     child: Text('edit Profile'),
                   ),

                  Padding(
                    padding: const EdgeInsets.only(top:40.0,bottom: 10),
                    child: new Text(
                      (userData.read('new')!=Null && userData.read('new'))?'Name : '+userData.read('userName'):'Name : '+dummyData[widget.adminBe].name,
                                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                  ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'About : '+userData.read('abouti'),
                          style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                      ),
                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (userData.read('new')==Null || !userData.read('new'))?'Phone No : '+dummyData[widget.adminBe].number:'Phone No : '+userData.read('userNumber'),
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Status : '+userData.read('stata'),

                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (userData.read('male'))?'Gender : Male ':'Gender : Female',

                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),
                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Join Date : '+dummyData[widget.adminBe].joinDate,
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),

                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Birthdate : '+userData.read('birthi'),
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),

                  Divider(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:8.0,bottom: 70),
                    child: Text(
                      'Work : '+userData.read('worki'),
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),



                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left:30.0),
              child: RaisedButton(
                  onPressed: (){
                    userData.write('isLogged', false);
                    userData.remove('admini');
                    userData.remove('userNumber');
                    userData.remove('abouti');
                    userData.remove('worki');
                    userData.remove('birthi');
                    userData.remove('male');
                    userData.remove('stata');
                    userData.remove('new');

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context)=> MyApp(),
                    ));
                  },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:10.0),
                  child: Text('LogOut',style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
                color: Colors.blue,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context)=> EditProfile()
                ));
              },
              child: Icon(Icons.edit),
              backgroundColor: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
