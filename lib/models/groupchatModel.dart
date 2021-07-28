

class groupChatModel {
  final String name;
  final String message;
  final String time;
  final String awatarUrl;
  final bool isOnline;
  final String number;

  groupChatModel({this.name, this.message, this.time, this.awatarUrl,this.isOnline,this.number});
}

List<groupChatModel> groupData = [

  new groupChatModel(
    name: "ALL chattybuddies",
    message: "www.techsickcommunity.tech",
    time: "28/03/2021",
    awatarUrl: 'assets/black.png',
    isOnline: true,
    number: 'QQQQQQQQQQ',
  ),

  new groupChatModel(
    name: "Friends",
    message: "Buddies are my life",
    time: "28/03/2021",
    awatarUrl: 'assets/black.png',
    isOnline: true,
    number: 'FFFFFFFFFF',
  ),

  new groupChatModel(
    name: "English Learning",
    message: "Only English Buddies",
    time: "28/03/2021",
    awatarUrl: 'assets/black.png',
    isOnline: true,
    number: 'EEEEEEEEEE',
  ),

  new groupChatModel(
    name: "Crazy's Group",
    message: "Only masti",
    time: "28/03/2021",
    awatarUrl: 'assets/black.png',
    isOnline: true,
    number: 'CCCCCCCCCC',
  ),
];