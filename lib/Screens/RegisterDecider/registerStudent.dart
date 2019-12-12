import 'package:flutter/material.dart';

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({
    Key key,
    this.email,
    this.password
  }) : super(key: key);

  final String email;
  final String password;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterStudent> {

  bool tutor = false;

  @override
  Widget build(BuildContext context) {
    //this view will ask the user for details about their account
    //make
    //make a collection in the database that makes use of the users id
    return Container(
      child: Text(widget.email, textScaleFactor: 4,),
      
    );
  }
}