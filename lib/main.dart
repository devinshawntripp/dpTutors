import 'package:dp_tutors/Screens/wrapper.dart';
import 'package:dp_tutors/Services/auth.dart';
import 'package:dp_tutors/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Screens/wrapper.dart';
import './models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: wrapper(),
      ),
    );
  }
}
