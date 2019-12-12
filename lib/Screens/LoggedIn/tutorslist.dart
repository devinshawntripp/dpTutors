import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dp_tutors/Screens/LoggedIn/tutortile.dart';
import 'package:dp_tutors/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TutorsList extends StatefulWidget {
  @override
  _TutorsListState createState() => _TutorsListState();
}

class _TutorsListState extends State<TutorsList> {
  @override
  Widget build(BuildContext context) {

    final tutors = Provider.of<List<Tutor>>(context);
    // print(tutors.documents);

    // tutors.forEach((tutor) {
    //   print(tutor.firstName);
    //   print(tutor.rating);
    // });

    return ListView.builder(
      itemCount: tutors.length,
      itemBuilder: (context, index) {
        return TutorTile(tutor: tutors[index]);
      },
      
    );
  }
}