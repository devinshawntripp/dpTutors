import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dp_tutors/Services/auth.dart';
import 'package:dp_tutors/Services/database.dart';
import 'package:dp_tutors/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './tutorslist.dart';

class Tutors extends StatefulWidget {
  @override
  _TutorsState createState() => _TutorsState();
}

class _TutorsState extends State<Tutors> {
  final AuthService _auth = AuthService();

  // var _filters = ["Rating", "Classes", "Rate"];
  @override
  Widget build(BuildContext context) {
    // final userdata = Provider.of<UserData>(context);
    // print(userdata.firstName);
    return StreamProvider<List<Tutor>>.value(
        value: DatabaseService().tutors,
        child: Scaffold(
          backgroundColor: Color(0xff3DDC97),
          appBar: AppBar(
            backgroundColor: Color(0xff46237A),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.exit_to_app),
                label: Text("Logout"),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
          body: Center(child: TutorsList()),
        ));
  }
}
