import 'package:flutter/cupertino.dart';

class chatModel {
  final String name;
  final String message;
  final String time;
  final String awatarUrl;
  final String joinDate;
  final bool male;
  final bool isOnline;
  final String number;

  chatModel({this.name, this.message, this.time, this.awatarUrl,this.joinDate,this.male,this.isOnline,this.number});
}

  List<chatModel> dummyData = [

    new chatModel(
      name: "Lisha Bot",
      message: "Always Available",
      time: "01:45",
      male: false,
      awatarUrl: 'assets/bot.png',
      joinDate: '30-04-2021',
      isOnline: true,
      number: '2222222222',
    ),
    new chatModel(
      name: "Rahul Bot",
      message: "Always Available",
      time: "01:45",
      male: true,
      awatarUrl: 'assets/bota.png',
      joinDate: '30-04-2021',
      isOnline: true,
      number: '1111111111',
    ),
    new chatModel(
      name: "chandan meriha",
      message: "Engineer hu Bewkoof nhi!",
      time: "29/03/21",
      awatarUrl: 'assets/chandan.webp',
      joinDate: '30-04-2021',
      isOnline: true,
      number: '9074710297',
    ),
    new chatModel(
      name: "nikhil som",
      message: "Play Boy from Makdi!",
      joinDate: '30-04-2021',
      time: "Yesterday",

      male: true,
      awatarUrl: 'assets/nikhil.webp',
      isOnline: true,
      number: '7646827438',
    ),
    new chatModel(
      name: "sourabh markam",
      message: "No about yarrr",
      time: "29/03/21",
      male: true,
      joinDate: '30-04-2021',
      awatarUrl: 'assets/sourabh.webp',
      isOnline: true,
      number: '8959652185',
    ),

    new chatModel(
      name: "rohit kumar",
      message: "www.techsickcommunity.tech",
      time: "26/03/21",
      awatarUrl: 'assets/rohit.png',
      male: true,
      joinDate: '30-04-2021',
      isOnline: false,
      number: '9399274490',
    ),
    new chatModel(
      name: "ajay kumar",
      message: "Sab moh maya haiii",
      time: "27/03/21",
      joinDate: '30-04-2021',
      male: true,
      awatarUrl: 'assets/ajay.webp',
      isOnline: true,
      number: '7489700480',
    ),
    new chatModel(
      name: "Deepika Sahu",
      message: "Going Well!",
      time: "29/03/21",
      male: false,
      awatarUrl: 'assets/black.png',
      isOnline: false,
      joinDate: '30-04-2021',
      number: '9399867945',
    ),
    new chatModel(
      name: "Bhumika Benarjee",
      message: "Not Available",
      joinDate: '30-04-2021',
      male: false,
      time: "31/03/21",
      awatarUrl: 'assets/black.png',
      isOnline: false,
      number: '8305016143',
    ),
    new chatModel(
      name: "any help/feedback",
      male: false,
      message: "Available for u special ;)",
      time: "01/04/21",
      awatarUrl: 'assets/black.png',
      joinDate: '02-05-2021',
      isOnline: true,
      number: '++++++++++',
    ),
    new chatModel(
      name: "new User",
      message: "......",
      male: true,
      time: "now",
      joinDate: '2 minites ago',
      awatarUrl: 'assets/black.png',
      isOnline: true,
      number: '----------',
    ),
  ];