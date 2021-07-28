import 'package:firebase_app/models/chatmodel.dart';
import 'package:flutter/cupertino.dart';

class messagesModel {
  final String user;
  final String message;
  final String num;
  final int id;
  final String time;
  final String url;

  messagesModel({this.user,this.num,this.id, this.message, this.time,this.url});
}

List<messagesModel> messagess = [
  // new messagesModel(
  //   user: "Lisha Bot",
  //   num: '2222222222',
  //   id: 0,
  //   message: "You are WELCOME",
  //   time: "19:35",
  //   url:dummyData[0].awatarUrl,
  // ),
  // new messagesModel(
  //   user: "Lisha Bot",
  //   num: '2222222222',
  //   id: 0,
  //   message: "Hii i'm Lisha",
  //   time: "19:35",
  //   url:dummyData[0].awatarUrl,
  // ),
  // new messagesModel(
  //   user: "Lisha Bot",
  //   id: 0,
  //   num: '2222222222',
  //   message: "From ChattyBuddies",
  //   time: "01:45",
  //   url:dummyData[0].awatarUrl,
  // ),
  // new messagesModel(
  //   user: "Lisha Bot",
  //   num: '2222222222',
  //   id: 0,
  //   message: "You are Welcome here!",
  //   time: "19:35",
  //   url:dummyData[0].awatarUrl,
  // ),
  // new messagesModel(
  //   user: "Lisha Bot",
  //   num: '2222222222',
  //   id: 0,
  //   message: "I'm Always available for you, Guys!",
  //   time: "19:35",
  //   url:dummyData[0].awatarUrl,
  // ),
  //
  // new messagesModel(
  //   user: "Rahul Bot",
  //   id: 1,
  //   num: dummyData[1].number,
  //   message: "You are WELCOME",
  //   time: "19:35",
  //   url:dummyData[1].awatarUrl,
  // ),
  // new messagesModel(
  //   user: "Rahul Bot",
  //   id: 1,
  //   num: dummyData[1].number,
  //   message: "Hii i'm Rahul",
  //   time: "19:35",
  //   url:dummyData[1].awatarUrl,
  // ),
  // new messagesModel(
  //   user: "Rahul Bot",
  //   id: 1,
  //   num: dummyData[1].number,
  //   message: "From ChattyBuddies",
  //   time: "01:45",
  //   url:dummyData[1].awatarUrl,
  // ),
  // new messagesModel(
  //   user: "Rahul Bot",
  //   num: dummyData[1].number,
  //   id: 1,
  //   message: "You are Welcome here!",
  //   time: "19:35",
  //   url:dummyData[1].awatarUrl,
  // ),
  // new messagesModel(
  //   user: "Rahul Bot",
  //   num: dummyData[1].number,
  //   id: 1,
  //   message: "I'm Always available for you, Guys!",
  //   time: "19:35",
  //   url:dummyData[1].awatarUrl,
  // ),
  new messagesModel(
    user: "ajay kumar",
    num: dummyData[6].number,
    id: 6,
    message: "hello!",
    time: "27/03/21",
    url:dummyData[6].awatarUrl,
  ),
  new messagesModel(
    user: "chandan meriha",
    id: 2,
    num: dummyData[2].number,
    message: "kaisa haii",
    time: "29/03/21",
    url:dummyData[2].awatarUrl,
  ),
  new messagesModel(
    user: "rohit kumar",
    id: 5,
    num: dummyData[5].number,
    message: "Pta haii",
    time: "19:35",
    url:dummyData[5].awatarUrl,
  ),
  new messagesModel(
    user: "sourabh markam",
    id: 4,
    num: dummyData[4].number,
    message: "abe yaar bhai kuch idea bta naa!",
    time: "01:45",
    url:dummyData[4].awatarUrl,
  ),
  new messagesModel(
    user: "ajay kumar",
    id: 6,
    num: dummyData[6].number,
    message: "hello yarr",
    time: "27/03/21",
    url:dummyData[6].awatarUrl,
  ),
  new messagesModel(
    user: "rohit kumar",
    id: 5,
    num: dummyData[5].number,
    message: "Apan Bhagwan haii",
    time: "19:35",
    url:dummyData[5].awatarUrl,
  ),
  new messagesModel(
    user: "sourabh markam",
    id: 4,
    num: dummyData[4].number,
    message: "oye kya chal rha haii",
    time: "01:45",
    url:dummyData[4].awatarUrl,
  ),
  new messagesModel(
    user: "sourabh markam",
    id: 4,
    num: dummyData[4].number,
    message: "apan to sab set haii.....",
    time: "01:45",
    url:dummyData[4].awatarUrl,
  ),
];