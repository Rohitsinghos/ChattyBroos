
import 'package:firebase_app/Pages/profile.dart';
import 'package:firebase_app/models/chatmodel.dart';
import 'package:firebase_app/models/messageModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChatRoom extends StatefulWidget {
  final chatModel name;
  final String admin;
  final int otherInt;

  ChatRoom({this.name,this.admin,this.otherInt});
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  int c=0;
  final userData=GetStorage();

  File _imageFile;
  bool _imgLoading=true;
  bool edited=false;
  bool loading=false;
  String _status="baba";
  int x;
  int u=0;


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
                        Accc();
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

  int bo=0;
  bool isbot=false;
  int textNum=0;
  int num=0;
  bool textUsers=false;
  var text=['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];
  var boto=['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];

  var temp=['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];

  var reply=['Welcom again','hello ','Good Morning','Sorry for inconvenience!','I can\'t understand you!\nPlease try later','Have a great day!','bye','bye','bye','ok','see you here',''];
  void nothing(){
    if(Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    setState(() {
    });
  }
  bool isadmin=false;
  bool limit=false;



  _deletebc(){
    userData.write(
        'bota${widget.name.number}${userData.read('userNumber')}',
        temp);
    userData.write('u${widget.name.number}${userData.read('userNumber')}',temp);
    userData.write('${widget.name.number}${userData.read('userNumber')}',0);

    u=0;
    for(int q=0;q<temp.length;q++){
      temp[q]=text[q];
      temp[q]=boto[q];
    }
  }

  _dataFullDialog(){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
              title: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Database is full for this chat so for further chat \nPlese clear Chat!"),
                ),),
              content: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: RaisedButton(
                        onPressed: (){
                          _deletebc();
                          Navigator.pop(context);
                        },
                        child: Text('Clear'),
                      ),
                    )
                  ],
                ),
              )
          );
        }
    );
  }


  _moreDialog(){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("More Options!"),
              ),),
            content: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[

                      RaisedButton(
                        onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context)=>ProfilePicPage(adminBe: widget.otherInt,)
                          ));

                          setState(() {   });
                        },
                        child: Text('See Profile',style: TextStyle(color: Colors.white,fontSize: 16),),
                        color: Colors.blue,

                      ),

                      RaisedButton(
                        onPressed: (){
                          _deletebc();
                          Navigator.pop(context);
                          setState(() {   });
                        },
                        child: Text('Clear Chat',style: TextStyle(color: Colors.white,fontSize: 16),),
                        color: Colors.blue,

                      ),

                      RaisedButton(
                        onPressed: (){
                          Navigator.pop(context);
                          setState(() {   });
                        },
                        child: Text('Block',style: TextStyle(color: Colors.white,fontSize: 16),),
                        color: Colors.blue,

                      ),


                      RaisedButton(
                        onPressed: (){
                              launch('https://techsickcommunity.tech/');
                              Navigator.pop(context);
                              setState(() {

                              });
                        },
                        child: Text('Visit Our website',style: TextStyle(color: Colors.white,fontSize: 16),),
                        color: Colors.blue,

                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.pop(context);
                            setState(() {   });
                          },
                          child: Text('Back',style: TextStyle(color: Colors.white,fontSize: 16),),
                          color: Colors.blue,

                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }

  _chatBubbles(String message,bool isHim,String time,bool isShameUser,int num){
    if((message[0]=='F' && message[1]=='I'&& message[2]=='L'&& message[3]=='E'&& message[4]==' '&& message[5]==':')){
      return  Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width*0.80,
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ]
              ),
              child: Text(message,style: TextStyle(color: Colors.white),),
            ),
          ),

          !isShameUser?Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54
                    ),
                  ),
                ],
              )

          ) : Container(
            child: null,
          )
        ],
      );

    }
    if(isHim){
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width*0.80,
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ]
              ),
              child: Text(message,style: TextStyle(color: Colors.black54),),
            ),
          ),
          !isShameUser?
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54
                    ),
                  ),
                ],
              )

          )
              : Container(
            child: null,
          )
        ],
      );
    }
    else if(isadmin || isbot){
      return  Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width*0.80,
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ]
              ),
              child: Text(message,style: TextStyle(color: Colors.white),),
            ),
          ),

          !isShameUser?Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54
                    ),
                  ),
                ],
              )

          ) : Container(
            child: null,
          )
        ],
      );

    }
    else if(textUsers && limit){
    return  Column(
        children: <Widget>[
        Container(
        alignment: Alignment.topRight,
        child: Container(
        constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width*0.80,
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
        color: Colors.blue[400],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
        BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        )
        ]
        ),
        child: Text(text[num],style: TextStyle(color: Colors.white),),
        ),
        ),

        !isShameUser?Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
        mainAxisAlignment:MainAxisAlignment.end,
        children: <Widget>[
        Text(time,
        style: TextStyle(
        fontSize: 12,
        color: Colors.black54
        ),
        ),
        ],
    )

    ) : Container(
    child: null,
    )
    ],
    );

    }
    else{
      return Container(
        child: null,
      );
    }
  }
  String prevUser="  ";

   final myController=TextEditingController();

  _sendMessageArea(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.attach_file),
            onPressed: (){_dialog();Accc();setState(() {

            });},
            iconSize: 25,
            color: Theme.of(context).primaryColor,
          ),
          Expanded(
            child: TextField(
              controller: myController,
              decoration: InputDecoration.collapsed(hintText: 'send a message..'),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(icon: Icon(Icons.send),
            onPressed: (){
              num=-1;

              if(myController.text !='' && u<101){

                text[u]=myController.text;
                u++;
                myController.text='';
                scrollBottom();

                userData.write(
                    'bota${widget.name.number}${userData.read('userNumber')}',
                    boto);
                userData.write('u${widget.name.number}${userData.read('userNumber')}',text);
                userData.write('${widget.name.number}${userData.read('userNumber')}',u);
                setState(() {

                });
                if(widget.otherInt==0||widget.otherInt==1)_botMessage();
              }
              else if(u>=101){
                _dataFullDialog();
              }

              setState(() {

              });
            },
            iconSize: 25,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  ScrollController _scrollController;

  void scrollBottom(){
    final bottomOffset= _scrollController.position.minScrollExtent;
    _scrollController.animateTo(bottomOffset, duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  @override
  void initState(){

    _scrollController= ScrollController();



    if(widget.otherInt<2){
      if (userData.read('bota${widget.name.number}${userData.read('userNumber')}') !=
          null && userData
          .read('u${widget.name.number}${userData.read('userNumber')}') !=
          null) {

        var x = userData
            .read('u${widget.name.number}${userData.read('userNumber')}');
        var y = userData
            .read('bota${widget.name.number}${userData.read('userNumber')}');
        int z=userData.read('${widget.name.number}${userData.read('userNumber')}');

        int ee=0;
        for (int q = 0; q < x.length; q++) {
          if(x[q]!='')
          print('${x[q]}<-');
          else if(y[q]!='')
          print('${y[q]}<-');

          text[q]=x[q];
          boto[q]=y[q];
        }

        print('${z},,\n');

        // text=x;
        // boto=y;
        u=z;
      }
    }
    else{
      if ( userData
          .read('u${widget.name.number}${userData.read('userNumber')}') !=
          null){

        var x = userData
              .read('u${widget.name.number}${userData.read('userNumber')}');
        for (int q = 0; q < x.length; q++) {
          if (x[q] != '') print('${x[q]}<-');


          text[q]=x[q];
        }

        int z=userData.read('${widget.name.number}${userData.read('userNumber')}');
        print('${z},,\n');
        u=z;

        // text=x;
        // u=z;
      }
    }


    super.initState();
  }


  Accc(){
    num=-1;

    if( u<101){

      text[u]= 'FILE : PICTURE File:\'data/...';

      u++;
      scrollBottom();

      userData.write(
          'bota${widget.name.number}${userData.read('userNumber')}',
          boto);
      userData.write('u${widget.name.number}${userData.read('userNumber')}',text);
      userData.write('${widget.name.number}${userData.read('userNumber')}',u);
    }
    else if(u>=101){
      _dataFullDialog();
    }

  }
   int love=0;
  _botMessage(){
    num=-1;
    if(love<10){
      text[u]='';

      String lol;

      if(userData.read('male') && !dummyData[widget.otherInt].male)
        lol='Mr Handsome ;)';
      else if(!userData.read('male') && dummyData[widget.otherInt].male)
        lol='Miss Beautiful ;)';

      if(userData.read('male') && dummyData[widget.otherInt].male)
        lol=' Bro :)';
      else if(!userData.read('male') && !dummyData[widget.otherInt].male)
        lol=' Bahan :)';


      if(love<2 || love>3)
      boto[u] = reply[love] + ' ' + lol+" !";
      else
        boto[u] = reply[love]+' :P';
      u++;
      myController.text = '';

      userData.write(
          'bota${widget.name.number}${userData.read('userNumber')}',
          boto);

      scrollBottom();
      setState(() {});
      userData.write(
          'bota${widget.name.number}${userData.read('userNumber')}',
          boto);
      userData.write('u${widget.name.number}${userData.read('userNumber')}',text);
      userData.write('${widget.name.number}${userData.read('userNumber')}',u);
      love++;
      if(love==1)_botMessage();

    }
  }


    @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        brightness: Brightness.dark,
        title: MaterialButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>ProfilePicPage(
                adminBe: widget.otherInt,
              )
            ));
          },
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(widget.name.awatarUrl),

                  ),
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        children: [
                          TextSpan(text: widget.name.name,style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                          TextSpan(text: '\n'),
                          widget.name.isOnline?
                          TextSpan(text: 'online',style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ))
                              : TextSpan(text: widget.name.time,style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ))
                        ]
                  ),
                ),
              ],
            ),
          ),
        ),
        leading: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
              Navigator.pop(context);
            },
              color: Colors.white,),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new IconButton(
              onPressed:() {
                _moreDialog();
                    setState(() {

                    });
              },
              icon: Icon(Icons.more_vert),
            ),
          )
        ],
        titleSpacing: 10,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: ListView.builder(
                reverse: true,
                controller: _scrollController,
                itemCount: messagess.length+u,
                itemBuilder: ( BuildContext context, int i){
                  i=messagess.length+u-i-1;
                  isbot=false;
                  if(i<messagess.length){
                    textUsers = false;
                    final String message = (i < messagess.length)
                        ? messagess[i].message
                        : text[i - messagess.length - 1];
                    final bool isMe = (widget.name.name == messagess[i].user);
                    final String time = messagess[i].time;
                    String check = !(i + 1 == messagess.length)
                        ? messagess[i + 1].user
                        : 'x';
                    final bool isShameUser = (check == messagess[i].user);
                    isadmin = (widget.admin == messagess[i].user);
                    prevUser = messagess[i].user;
                    limit = false;
                    return _chatBubbles(message, isMe, time, isShameUser,0);
                  }
                  else if(text[i-messagess.length]==''){
                    num=i-messagess.length;
                    int t=messagess.length+u-i-1;
                    String tame=(messagess.length+u!=i+1)?("$t sec ago"):'now';
                    return _chatBubbles(boto[num], true, tame, false,num);
                  }
                  else{
                    num=i-messagess.length;
                    textUsers = true;
                    limit=true;
                    int t=messagess.length+u-i-1;
                    String tame=(messagess.length+u!=i+1)?("$t sec ago"):'now';
                    return _chatBubbles(text[num], false, tame, false,num);
                  }
                },
              ),
            )

          ),
          _sendMessageArea()

        ],
      )
    );
  }
}
