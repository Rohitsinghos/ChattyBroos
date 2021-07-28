import 'package:firebase_app/models/chatmodel.dart';
import 'package:firebase_app/newSign.dart';
import 'package:firebase_app/whatsapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';


class SignInPage extends StatefulWidget {


  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final userData = GetStorage();
  bool chacked=false;
  String ans='Check';
  String text='';
  String status='Please enter your Phone Number';
  final myController=TextEditingController();
  bool ok=false;

  _enterNum(){
     ok=true;
    for(int i=2;i < dummyData.length;i++){
      if(text==dummyData[i].number){




        userData.write('isLogged', true);
        userData.write('userName', dummyData[i].name);
        userData.write('userNumber', dummyData[i].number);
        userData.write('abouti', dummyData[i].message);
        userData.write('worki', "student");
        userData.write('birthi', "00-00-0000");
        userData.write('stata', "online");
        userData.write('male', dummyData[i].male);
        userData.write('new', false);
        userData.write('admini', i);

        if(userData.read(
            'bota${dummyData[0].number}${userData.read('userNumber')}')==null && userData.read(
            'u${dummyData[0].number}${userData.read('userNumber')}')==null){
          var boto=['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];
          userData.write(
              'u${dummyData[0].number}${userData.read('userNumber')}', boto);
          userData.write(
              'u${dummyData[1].number}${userData.read('userNumber')}', boto);
          boto[0] = 'Welcome ' + dummyData[i].name;

          userData.write(
              'bota${dummyData[0].number}${userData.read('userNumber')}', boto);
          userData.write(
              '${dummyData[0].number}${userData.read('userNumber')}', 1);

          userData.write(
              'bota${dummyData[1].number}${userData.read('userNumber')}', boto);
          userData.write(
              '${dummyData[1].number}${userData.read('userNumber')}', 1);
        }

        ok=false;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=> whatsApp(admin: i,)
        ));

      }

    }


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
              child: Text('Sorry sir! this mobile num +91 '+text+" is not exist!\n\n\tCreate New",style: TextStyle(fontSize: 20),),
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
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Text('Try Again!',style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
              color: Theme.of(context).primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: RaisedButton(
                onPressed: (){
      launch("mailto:techsickcommunity@gmail.com?subject=Regarding Feedback for ChattyBuddies App!&body=To,\nThe ts-community administration,\nRaipur.\n\nSir,\nMy Name -\n My Phone No."+text+"\n Resister on the ChaatyBuddies App.\nthe thing is \n\nThank You!");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:8),
                  child: Text('FeedBack',style: TextStyle(color: Colors.white,fontSize: 18),),
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
    if(myController.text.length==10){
      ok=true;
      ans='Get In';
      chacked=true;
    }else{
      ok=false;
      ans='Check';
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
        title: Text('Existing User'),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 30),
            child: Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 120,
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
                      child: (ok)?IconButton(
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
          ),

        ],
      ),
      floatingActionButton: Stack(
        children: <Widget>[
        Align(
          alignment: Alignment.bottomRight,
          child: RaisedButton(
            onPressed: (){

              if(chacked && myController.text.length==10){
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
                      builder: (context)=> SignNewInPage(),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:15.0),
                  child: Text("Create New",style: TextStyle(fontSize: 22,color: Colors.white),),
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
