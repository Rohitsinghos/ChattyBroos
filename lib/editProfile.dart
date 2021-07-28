
import 'package:firebase_app/whatsapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';



class EditProfile extends StatefulWidget {


  @override
  _SignNewInPageStatee createState() => _SignNewInPageStatee();
}

class _SignNewInPageStatee extends State<EditProfile> {


  final userData = GetStorage();

  bool chacked=true,chackedN=true,chackAb=true,chackWork=true,chackBi=true;
  String ans='Check';
  String text='';
  String status='Please enter your Phone Number';
  final myController=TextEditingController();
  final myControllerName=TextEditingController();
  final myControllerAb=TextEditingController();
  final myControllerWo=TextEditingController();
  final myControllerBi=TextEditingController();
  bool mali;
  bool ok=true;


  void initState(){
    myController.text=userData.read('stata');
    myControllerName.text=userData.read('userName');
    myControllerAb.text=userData.read('abouti');
    myControllerWo.text=userData.read('worki');
    myControllerBi.text=userData.read('birthi');
    mali=userData.read('male');
    super.initState();
  }

  void _checkPhone(){
    int p=myController.text.length;
    print(myController.text+"  --->   $p\n");

    if(myControllerName.text.length>2 && myControllerName.text.length<21){
      chackedN=true;
    }else{
      chackedN=false;
    }
    if(myController.text.length>2 && myController.text.length<21){
      chacked=true;
    }else{
      chacked=false;
    }
    if(myControllerAb.text.length>2 && myControllerAb.text.length<31){
      chackAb=true;
    }else{
      chackAb=false;
    }
    if(myControllerWo.text.length>2 && myControllerWo.text.length<21){
      chackWork=true;
    }else{
      chackWork=false;
    }

    if(myControllerBi.text.length==10 && (myControllerBi.text[3]!='0' || myControllerBi.text[4]!='0')&& (myControllerBi.text[0]!='0' || myControllerBi.text[1]!='0')&& (myControllerBi.text[0]!='3' || myControllerBi.text[1]=='0' || myControllerBi.text[1]=='1')&&(myControllerBi.text[0]=='1' || myControllerBi.text[0]=='0' || myControllerBi.text[0]=='2' || myControllerBi.text[0]=='3')&&( myControllerBi.text[3]=='0' || myControllerBi.text[3]=='1' ) && (myControllerBi.text[3]!='1' || myControllerBi.text[4]=='0' || myControllerBi.text[4]=='1' || myControllerBi.text[4]=='2') && ((myControllerBi.text[6]=='2' &&myControllerBi.text[7]=='0')|| (myControllerBi.text[6]=='1' &&myControllerBi.text[7]=='9'))&& (myControllerBi.text[3]=='0'|| myControllerBi.text[3]=='1')){
      chackBi=true;
    }else{
      chackBi=false;
    }

    if(chacked && chackedN && chackAb && chackWork && chackBi){
      ok=true;
      ans='Get In';
    }else{
      ok=false;
      ans='Check';
    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30),
              child: Container(
                child: Container(


                  child: Column(
                    children: <Widget>[


                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 50,
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Name : ',style: TextStyle(fontSize: 20),),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: myControllerName,
                                  decoration: InputDecoration.collapsed(hintText: 'Enter your user Name..',hintStyle: TextStyle(fontSize: 17),),
                                  keyboardType: TextInputType.text,
                                  onTap: _checkPhone,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (chackedN)?IconButton(
                                    icon: Icon(Icons.check,size: 40,),
                                    iconSize: 30,
                                    onPressed: (){
                                    }
                                )
                                    :CircularProgressIndicator(),
                              )
                            ],
                          ),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 50,
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('About : ',style: TextStyle(fontSize: 20),),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: myControllerAb,
                                  decoration: InputDecoration.collapsed(hintText: 'Actor/Engineer/Doc...',hintStyle: TextStyle(fontSize: 17),),
                                  keyboardType: TextInputType.text,
                                  onTap: _checkPhone,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (chackAb)?IconButton(
                                    icon: Icon(Icons.check,size: 40,),
                                    iconSize: 30,
                                    onPressed: (){
                                    }
                                )
                                    :CircularProgressIndicator(),
                              )
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 50,
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Status - ',style: TextStyle(fontSize: 20),),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: myController,

                                  decoration: InputDecoration.collapsed(hintText: 'Online...',hintStyle: TextStyle(fontSize: 17),),
                                  keyboardType: TextInputType.text,
                                  onTap: _checkPhone,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (chacked)?IconButton(
                                    icon: Icon(Icons.check,size: 40,),
                                    iconSize: 30,
                                    onPressed: (){
                                    }
                                )
                                    :CircularProgressIndicator(),
                              )
                            ],
                          ),
                        ),
                      ),



                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 50,
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Birth : ',style: TextStyle(fontSize: 20),),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: myControllerBi,
                                  decoration: InputDecoration.collapsed(hintText: '00-00-0000',hintStyle: TextStyle(fontSize: 17),),
                                  keyboardType: TextInputType.datetime,
                                  onTap: _checkPhone,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (chackBi)?IconButton(
                                    icon: Icon(Icons.check,size: 40,),
                                    iconSize: 30,
                                    onPressed: (){
                                    }
                                )
                                    :CircularProgressIndicator(),
                              )
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 50,
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Work : ',style: TextStyle(fontSize: 20),),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: myControllerWo,
                                  decoration: InputDecoration.collapsed(hintText: 'Student..',hintStyle: TextStyle(fontSize: 17),),
                                  keyboardType: TextInputType.text,
                                  onTap: _checkPhone,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (chackWork)?IconButton(
                                    icon: Icon(Icons.check,size: 40,),
                                    iconSize: 30,
                                    onPressed: (){
                                    }
                                )
                                    :CircularProgressIndicator(),
                              )
                            ],
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top:20.0,bottom: 50.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 50,
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Gender : ',style: TextStyle(fontSize: 20),),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[

                                    RaisedButton(
                                        onPressed: (){
                                          mali=true;
                                          setState(() {

                                          });
                                        },
                                      child: Text('male',style: TextStyle(color: Colors.white),),
                                      color: (mali)?Colors.blue : Colors.grey[400],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0),
                                      child: RaisedButton(
                                        onPressed: (){
                                          mali=false;
                                          setState(() {

                                          });
                                        },
                                        child: Text('female',style: TextStyle(color: Colors.white),),
                                        color: (!mali)?Colors.blue : Colors.grey[400],
                                      ),
                                    )
                                  ],
                                )
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>whatsApp(admin: userData.read('admini'),) ));
                },
                child:  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text('Back',style: TextStyle(fontSize: 22,color: Colors.white),),


                ),
                color: Colors.blue,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: RaisedButton(

              onPressed: (){
                if(ok){

                  userData.write('userName', myControllerName.text);
                  userData.write('abouti', myControllerAb.text);
                  userData.write('worki', myControllerWo.text);
                  userData.write('birthi', myControllerBi.text);
                  userData.write('stata', myController.text);
                  userData.write('male', mali);
                  userData.write('new', true);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => whatsApp(
                        admin: userData.read('admini'),
                      )));
                }
                _checkPhone();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 15),
                child: Text("Done",style: TextStyle(fontSize: 22,color: Colors.white),),
              ),
              color: Colors.blue,
            ),
          )
        ],
      )

    );
  }
}
