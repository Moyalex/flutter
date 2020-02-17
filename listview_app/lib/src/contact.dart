import 'package:flutter/material.dart';
import 'package:listview_app/src/model/contact_model.dart';
import 'package:listview_app/src/screens/contact_items.dart';

class Contact extends StatelessWidget {
  
  buildList(){
    return <ContactModel>[
      ContactModel(name: "Rodrigo Morales",email : "rodrigo@flutter.io"),
      ContactModel(name: "Martin Morales",email : "rodrigo@flutter.io"),
      ContactModel(name: "Linux Morales",email : "rodrigo@flutter.io"),
      ContactModel(name: "Steve Morales",email : "rodrigo@flutter.io"),
      ContactModel(name: "Dennis Morales",email : "rodrigo@flutter.io"),
    ];
  }

  List<ContactItem> buildContactList(){
    return buildList()
    .map<ContactItem>((contact) => ContactItem(contact:contact,))
    .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Contactos")
      ),
      body: ListView(
        children: buildContactList()
      ),
    );
  }
}