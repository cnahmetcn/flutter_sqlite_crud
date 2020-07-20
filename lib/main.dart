import 'package:crud/add.dart';
import 'package:crud/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:crud/helpers/database_helper.dart';
import 'package:crud/details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        home: Scaffold(
          appBar: AppBar(
            title: Text("CRUD with SQlite"),
            actions: <Widget>[
              PopupMenuButton(
                itemBuilder: (content) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("Add"),
                  ),
                ],
                onSelected: (int menu) {
                  if (menu == 1) {
                    navigatorKey.currentState.push(
                        MaterialPageRoute(builder: (content) => AddPage()));
                  }
                },
              )
            ],
          ),
          body: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = new DatabaseHelper();
    return Padding(
      padding: EdgeInsets.all(10),
      child: FutureBuilder<List>(
        future: db.finfAll(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Contact contact = Contact.fromJson(snapshot.data[index]);
                return Card(
                  child: ListTile(
                    title: Text(contact.name),
                    subtitle: Text(contact.phone),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContactDetailsPage(
                              contact: contact,
                            ),
                          ));
                    },
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
