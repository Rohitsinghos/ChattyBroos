import 'package:firebase_app/models/chatmodel.dart';
import 'package:firebase_app/signInScreen.dart';
import 'package:firebase_app/whatsapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';


class SignNewInPage extends StatefulWidget {


  @override
  _SignNewInPageState createState() => _SignNewInPageState();
}

class _SignNewInPageState extends State<SignNewInPage> {

  final userData = GetStorage();
  bool chacked=false,chackedN=false;
  String ans='Check';
  String text='';
  String status='Please enter your Phone Number';
  final myController=TextEditingController();
  final myControllerName=TextEditingController();
  bool ok=false;

  _enterNum(){
    ok=true;

        userData.write('isLogged', true);
        userData.write('userNumber', myController.text);
        userData.write('userName', myControllerName.text);
        userData.write('abouti', 'New at ChattyBuddies');
        userData.write('worki', "student");
        userData.write('birthi', "00-00-0000");
        userData.write('stata', "online");
        userData.write('male', dummyData[10].male);
        userData.write('new', true);
        userData.write('admini', 10);


    if(userData.read('bota${dummyData[0].number}${userData.read('userNumber')}')==null
        && userData.read('u${dummyData[0].number}${userData.read('userNumber')}')==null
    ){
      var boto=['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];
      userData.write(
          'u${dummyData[0].number}${userData.read('userNumber')}', boto);
      userData.write(
          'u${dummyData[1].number}${userData.read('userNumber')}', boto);

      boto[0] = 'Welcome ' + userData.read('userName');

      userData.write(
          'bota${dummyData[0].number}${userData.read('userNumber')}', boto);
      userData.write(
          '${dummyData[0].number}${userData.read('userNumber')}', 1);

      userData.write(
          'bota${dummyData[1].number}${userData.read('userNumber')}', boto);
      userData.write(
          '${dummyData[1].number}${userData.read('userNumber')}', 1);
    }


        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=>whatsApp(admin: userData.read('admini'),)
        ));


      ok=false;


    if(ok){
      chacked=false;
      ans='Check';
      ok=false;
      setState(() {

      });
      _showDialog();
    }
  }

  _showDialog(){
    return showDialog(context: context,builder: (BuildContext context) {
      return AlertDialog(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Sorry! this mobile num +91 '+text+" is not resistered!\n\n\tChoose resister",style: TextStyle(fontSize: 20),),
            ),
          ),
        ),
        content: Row(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Back',style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
              color: Theme.of(context).primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: RaisedButton(
                onPressed: (){
                  launch("mailto:techsickcommunity@gmail.com?subject=Regarding +91"+text+" Resister on ChattyBuddies App!&body=To,\nThe ts-community administration,\nRaipur.\n\nSir,\nMy Name -\n My Phone No."+text+"\n Resister on the ChaatyBuddies App.\n\nThank You!");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Resister',style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      );
    });
  }

  void _checkPhone(){
    int p=myController.text.length;
    print(myController.text+"  --->   $p\n");
    if(myController.text.length==10 && myControllerName.text.length>2){
      ok=true;
      ans='Get In';
    }else{
      ok=false;
      ans='Check';
    }
    if(myControllerName.text.length>2){
      chackedN=true;
    }else{
      chackedN=false;
    }
    if(myController.text.length==10){
      chacked=true;
    }else{
      chacked=false;
    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Create New'),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 30),
            child: Container(
              child: Container(


                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      height: 80,
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
                              decoration: InputDecoration.collapsed(hintText: 'Enter your Name..',hintStyle: TextStyle(fontSize: 17),),
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

                    Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        height: 100,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('+91',style: TextStyle(fontSize: 20),),
                            ),
                            Expanded(
                              child: TextField(
                                controller: myController,
                                decoration: InputDecoration.collapsed(hintText: 'Enter your Mo. Number..',hintStyle: TextStyle(fontSize: 17),),
                                keyboardType: TextInputType.number,
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
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: RaisedButton(
              onPressed: (){

                if(ok && myController.text.length==10 && myControllerName.text.length > 2){
                  text=myController.text;
                  _enterNum();
                }
                _checkPhone();
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(ans,style: TextStyle(fontSize: 22,color: Colors.white),),
              ),
              color: Colors.blue,
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: RaisedButton(
                onPressed: (){

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context)=>SignInPage()
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:15.0),
                  child: Text("Existing User",style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
