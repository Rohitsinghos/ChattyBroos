import 'package:firebase_app/Pages/profile.dart';
import 'package:firebase_app/models/groupchatModel.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_app/models/messageModel.dart';
import 'package:firebase_app/models/chatmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class groupChatRoom extends StatefulWidget {
  final groupChatModel name;
  final String admin;
  final int adminInt;

  groupChatRoom({this.name,this.admin,this.adminInt});
  @override
  _groupChatRoomState createState() => _groupChatRoomState();
}

class _groupChatRoomState extends State<groupChatRoom> {
  final userData=GetStorage();
  int u=0;
  int textNum=0;
  int num=0;
  bool textUsers=false;
  var text=['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];

  var temp=['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];


  _deletebc(){
    userData.write('u${widget.name.number}${userData.read('userNumber')}',temp);
    userData.write('${widget.name.number}${userData.read('userNumber')}',0);
    u=0;
    for(int q=0;q<temp.length;q++){
      temp[q]=text[q];
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

  void nothing(){
    if(Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    setState(() {
    });
  }
  bool isadmin=false;
  bool limit=false;
  int kk;

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
    if(isHim && !isadmin){
      return Column(
          children: <Widget>[
            Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:8.0,top: 5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:0.0),
              child:  CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage(messagess[kk].url),
                ),
            ),
          ),
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
        ],
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
    else if(isadmin){
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
            onPressed: (){},
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

                userData.write('u${widget.name.number}${userData.read('userNumber')}',text);
                userData.write('${widget.name.number}${userData.read('userNumber')}',u);

              }else if(u>=101){
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


    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          brightness: Brightness.dark,
          title:  Padding(
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
                onPressed:(){ _moreDialog();
                setState(() {

                });},
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
                      int x=i;
                      i=messagess.length+u-i-1;
                      kk=i;



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
                        return _chatBubbles(message, true, time, isShameUser,0);
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
