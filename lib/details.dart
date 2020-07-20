import 'package:crud/helpers/database_helper.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:crud/models/contact.dart';
import 'package:crud/edit.dart';

import 'main.dart';

class ContactDetailsPage extends StatefulWidget {
  Contact contact;

  ContactDetailsPage({Key key, this.contact}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ContactDetailsPageState();
  }
}

class ContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Contact Details"),
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.contact.name),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Phone",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.contact.phone),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Address",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.contact.address),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.contact.email),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.contact.description),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text("Edit"),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPage(
                                  contact: widget.contact,
                                ),
                              ));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                    ),
                    Expanded(
                      child: RaisedButton(
                        child: Text("Delete"),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return new AlertDialog(
                                  title: Text("Confirm"),
                                  content: Text("Are you sure"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("OK"),
                                      onPressed: () async {
                                        var db = DatabaseHelper();
                                        await db.delete(widget.contact.id);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MyApp(),
                                            ));
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("Cancel"),
                                      onPressed: () {
                                        Navigator.pop(
                                          context,
                                        );
                                      },
                                    ),
                                  ],
                                );
                              });
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
