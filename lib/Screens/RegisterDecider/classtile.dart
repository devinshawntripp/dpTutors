import 'package:dp_tutors/Screens/RegisterDecider/classlist.dart';
import 'package:flutter/material.dart';
import 'package:dp_tutors/models/user.dart';
import 'package:dp_tutors/Screens/RegisterDecider/registerTutor.dart';

class ClassTile extends StatefulWidget {
  final String classname;
  ClassTile({this.classname});
  @override
  _ClassTileState createState() => _ClassTileState();
}


class _ClassTileState extends State<ClassTile> {


  int selectedColor = 0xff256EFF;

  toggleColor() {
    if (selectedColor == 0xff256EFF) {
      selectedColor = 0xff3DDC97;
    } else {
      selectedColor = 0xff256EFF;
    }
  }

  addclass(String name) {
    if(selectedColor == 0xff256EFF){
      takenClasses.remove(name);
    } else {
      takenClasses.add(name);
    }
  }
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.80,
        height: 0,
        
          child: Align(
            alignment: Alignment.center,
              child: SizedBox(
                height: 75,
                child: Card(
                  
                margin: EdgeInsets.fromLTRB(20.0, 3.0, 5.0, 3.0),
                
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ListTile(
                    onTap: (() {
                      
                      setState(() {
                        toggleColor();
                        addclass(widget.classname);
                        
                      });
                      
                      for (var some in takenClasses) {
                        print("some class added" + some);
                      };
                      print(selectedColor);
                      
                      print(widget.classname + " Tapped");
                    }),
                    contentPadding: EdgeInsets.only(left: 5),
                    leading: Icon(
                      Icons.assignment
                    ),
                    title: Text(
                    widget.classname,
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 20, 
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  ),
                ),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(0))
                ),
                color: Color(selectedColor),
                elevation: 10,
            ),
              ),
          )
      ),
    );
  }
}


