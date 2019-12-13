import 'package:dp_tutors/Screens/RegisterDecider/classtile.dart';
import 'package:dp_tutors/Screens/RegisterDecider/registerTutor.dart';
import 'package:dp_tutors/models/user.dart';
import 'package:flutter/material.dart';



class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  
  
  
  

  
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: classes.length,
      itemBuilder: (context, index) {
        
        return ClassTile(classname: classes[index]);
      },
      
    );
  }
}