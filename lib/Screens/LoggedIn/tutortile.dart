import 'package:flutter/material.dart';
import 'package:dp_tutors/models/user.dart';

class TutorTile extends StatelessWidget {
  final Tutor tutor;

  TutorTile({this.tutor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Container(
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
          child: ListTile(
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
