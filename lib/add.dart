import 'package:crud/helpers/database_helper.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:crud/models/contact.dart';

import 'main.dart';

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddPageState();
  }
}

class AddPageState extends State<AddPage> {
  var textEditingControllerName = new TextEditingController();
  var textEditingControllerPhone = new TextEditingController();
  var textEditingControllerDescription = new TextEditingController();
  var textEditingControllerEmail = new TextEditingController();
  var textEditingControllerAdress = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        title: Text("Add Contact"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: "Name"),
              controller: textEditingControllerName,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Phone"),
              controller: textEditingControllerPhone,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Adress"),
              controller: textEditingControllerAdress,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              controller: textEditingControllerEmail,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Description"),
              controller: textEditingControllerDescription,
              maxLines: 5,
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text("Save"),
                    onPressed: () async{
                      var contact = new Contact(
                        name: textEditingControllerName.text,
                        description: textEditingControllerDescription.text,
                        phone: textEditingControllerPhone.text,
                        address: textEditingControllerAdress.text,
                        email: textEditingControllerEmail.text,
                      );
                      var db = DatabaseHelper();
                      await db.create(contact);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ));
                    },
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    ));
  }
}
