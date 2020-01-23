import 'package:dp_tutors/Screens/RegisterDecider/classlist.dart';
import 'package:flutter/material.dart';
import 'package:dp_tutors/models/user.dart';
import 'package:dp_tutors/Screens/RegisterDecider/registerTutor.dart';

class StarTile extends StatefulWidget {
  final Tutor tutor;
  StarTile({this.tutor});
  @override
  _StarTileState createState() => _StarTileState();
}

class _StarTileState extends State<StarTile> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      size: 40,
      color: Colors.amber[300],
    );
  }
}
