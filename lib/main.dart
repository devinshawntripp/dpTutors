import 'package:dp_tutors/Screens/wrapper.dart';
import 'package:flutter/material.dart';
import './Screens/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // inputDecorationTheme: InputDecorationTheme(
          //     focusedBorder: UnderlineInputBorder(
          //         borderSide: BorderSide(color: Colors.white)
          //     ),
          //     enabledBorder: UnderlineInputBorder(
          //         borderSide: BorderSide(color: Colors.white)
          //     )
          // )
          ),
      home: MyHomePage(title: 'DPTutors'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return wrapper();
  }
}
