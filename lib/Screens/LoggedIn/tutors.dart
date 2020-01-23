import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dp_tutors/Screens/LoggedIn/otherScreens/openpagesanim.dart';
import 'package:dp_tutors/Services/auth.dart';
import 'package:dp_tutors/Services/database.dart';
import 'package:dp_tutors/models/user.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_flare/smart_flare.dart';
import './tutorslist.dart';
import 'Classes/allclasses.dart';

class Tutors extends StatefulWidget {
  @override
  _TutorsState createState() => _TutorsState();
}

class _TutorsState extends State<Tutors> {
  final AuthService _auth = AuthService();

  String userFirstName = "test";
  
  // var _filters = ["Rating", "Classes", "Rate"];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    // final userdata = Provider.of<UserData>(context);
    // print(userdata.firstName);
    var screensize = MediaQuery.of(context).size;

    return StreamProvider<List<Tutor>>.value(
        value: DatabaseService().tutors,
        child: Scaffold(
          backgroundColor: Color(0xff3DDC97),
          appBar: AppBar(
            backgroundColor: Color(0xff46237A),
            actions: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(screensize.width * .19,
                      screensize.height * .01, screensize.width * .2, 0),
                  child: Text(
                    "Tutors",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
              Container(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton.icon(
                    icon: Icon(Icons.exit_to_app),
                    label: Text("Logout"),
                    onPressed: () async {
                      await _auth.signOut();
                    },
                  ),
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: StreamBuilder(
                    stream: Firestore.instance.collection("Tutors").document(user.uid).snapshots(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData) {
                        userFirstName = snapshot.data['firstname'] ?? "";
                        return Text(snapshot.data['firstname'] ?? "");
                      }
                    },
                  ),
                  accountEmail: Text("Some Email"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color(0xff3DDC97),
                    child: Text(
                      userFirstName[0],
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                      )
                    )
                  ),
                ),
                ListTile(
                  title: Text("Home"),
                  trailing: Icon(Icons.home),
                  onTap: () {
                    
                  },


                ),
                ListTile(
                  title: Text("Classes"),
                  trailing: Icon(Icons.class_),
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => AllClasses()));
                  },
                  

                ),
                ListTile(
                  title: Text("Settings"),
                  trailing: Icon(Icons.settings),
                  

                )
              ],
            ),
          ),
          body: Stack(children: <Widget>[
            Container(
              
              child: Center(
                  child: Column(
                children: <Widget>[
                  Expanded(
                    child: TutorsList(),
                  ),
                ],
              )),
            ),
            Container(
              width: screensize.width,
              height: screensize.height * 0.12,
            ),
          ]),
        ));
  }
}
