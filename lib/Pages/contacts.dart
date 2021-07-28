import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';




class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts;

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  Future<void> getContacts() async {
    //Make sure we already have permissions for contacts when we get to this
    //page, so we can just retrieve it
    final List<Contact> contacts = (await ContactsService.getContacts()).toList();
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text('Your Contacts - Invite')),
      ),
      body: Container(
        child:(_contacts != null)
        //Build a list view of all contacts, displaying their avatar and
        // display name
            ? ListView.builder(
          itemCount: _contacts?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            Contact contact = _contacts?.elementAt(index);

            String nnn="";
            String pho="";

            for(int i=0;i < contact.phones.length && (contact.phones.length == 1 || i < contact.phones.length-1  );i++){
              print(contact.phones.toList().elementAt(i).value);
              print("  {$i}\n");

              nnn+=(contact.phones.toList().elementAt(i).value)+" , ";
            }

            if(contact.phones.length != 0){
              pho = contact.phones.toList().elementAt(0).value;
            }


            return RaisedButton(
              onPressed: (){
                launch('sms:'+pho+' ?body=I\'m inviting you at ChattyBuddies Let\'s Chat here!,\n Download ChattyBuddies App for this go to www.techsickcommunity.tech\n let\'s meet me, on ChattyBuddies');
              },
              child: ListTile(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                leading: (contact.avatar != null && contact.avatar.isNotEmpty)
                    ? CircleAvatar(
                  backgroundImage: MemoryImage(contact.avatar),
                )
                    : CircleAvatar(
                  child: Text(contact.initials()),
                  backgroundColor: Theme.of(context).accentColor,
                ),
                title: Text(contact.displayName ?? ''),
                subtitle: Text((nnn == "")?"Number deleted": nnn),
              ),
            );
          },
        )
            : Center(child: const CircularProgressIndicator()),
      ),
    );
  }
}