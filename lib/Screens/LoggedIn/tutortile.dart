import 'package:flutter/material.dart';
import 'package:dp_tutors/models/user.dart';
import 'package:dp_tutors/Screens/LoggedIn/tutor.dart';
import 'package:provider/provider.dart';

class TutorTile extends StatelessWidget {
  final Tutor tutor;

  TutorTile({this.tutor});
  
  @override
  Widget build(BuildContext context) {
    print("some bullshit");
    print(tutor.classes);
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Container(
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
          child: ListTile(
            onTap: (() {
              //need to get the document id from the database and
              //pass it in as a value into Tutor so 
              //that this class can access all of the data of that 
              //tutor
              
              Navigator.push(context, MaterialPageRoute(builder: (context) => TutorClass(tutor: tutor,)));
              
            }),
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue,
            ),
            title: Text(tutor.firstName),
            subtitle: Text("Rating: ${tutor.rating}"),
          ),
        ),
      ),
    );
  }
}
