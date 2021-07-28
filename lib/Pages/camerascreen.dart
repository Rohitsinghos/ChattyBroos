import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

_showAlert(){
  return showDialog(context: context,builder: (BuildContext context) {
    return AlertDialog(
      title: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('This is on Construction Mode!'),
        ),
      ),
      content: RaisedButton(
        onPressed: nothing,
        child: Text('OK',style: TextStyle(color: Colors.white),),
        color:  Theme.of(context).primaryColor,
      ),
    );
  });
}


Icon okk=Icon(Icons.camera_alt,color: Colors.white,);
int op=0;
void nothing(){

    Navigator.pop(context);
  setState(() {
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
          child: new Text('Gallery',style: new TextStyle(fontSize: 22),)),
      floatingActionButton: new FloatingActionButton(
      child: okk,
      onPressed: ()=> _showAlert(),
      backgroundColor: Theme.of(context).primaryColor,
    ),
    );
  }
}
