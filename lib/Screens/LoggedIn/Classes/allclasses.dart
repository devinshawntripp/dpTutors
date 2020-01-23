import 'package:flutter/material.dart';


class AllClasses extends StatefulWidget {
  @override
  _AllClassesState createState() => _AllClassesState();
}

class _AllClassesState extends State<AllClasses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3DDC97),
      appBar: AppBar(backgroundColor: Color(0xff46237A),),
      body: Container(
        child: Text("This code will be delete: what needs to happen is I need to make a collection in the database that will store all of the classes available by unt or by manually entering them into the database. After this I will need to then allow people to upload files on certain classes"),
      ),
      
    );
  }
}