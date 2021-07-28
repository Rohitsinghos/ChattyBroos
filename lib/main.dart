import 'package:firebase_app/models/chatmodel.dart';
import 'package:firebase_app/signInScreen.dart';
import 'package:firebase_app/whatsapp.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userData=GetStorage();




  bool okk(){
    if(userData.read('isLogged')==null)
      return false;
    if(!userData.read('isLogged'))
      return false;
    if(userData.read('admini')==null)
      return false;

    if(userData.read('bota${dummyData[0].number}${userData.read('userNumber')}')==null
        && userData.read('u${dummyData[0].number}${userData.read('userNumber')}')==null)
      return false;

    if(userData.read('stata')==null|| userData.read('male')==null || userData.read('userName')==null ||userData.read('abouti')==null|| userData.read('worki')==null|| userData.read('birthi')==null|| userData.read('new')==null || userData.read('userNumber')==null)
      return false;

      String st = userData.read('stata');
    String na = userData.read('userName');
    String ab = userData.read('abouti');
    String wo = userData.read('worki');
    String bi = userData.read('birthi');


    if(userData.read('admini')<2 || userData.read('admini')>10){
      return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChattyBuddies',
      theme: new ThemeData(
        primaryColor: Colors.blue,
        accentColor: new Color(0xff250366),
      ),
      home: (okk())?whatsApp(admin: userData.read('admini'),):SignInPage(),
    );
  }
}
