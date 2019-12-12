import 'package:dp_tutors/Screens/RegisterDecider/registerStudent.dart';
import 'package:dp_tutors/Screens/RegisterDecider/registerTutor.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

// class _RegisterState extends State<Register> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }

class _RegisterState extends State<Register> {

  String choice = "null";
  @override
  Widget build(BuildContext context) {
    if(choice == "tutor"){
      return RegisterTutor();
    } else if(choice == "student") {
      return RegisterStudent();
    } else {
      return Scaffold(
      backgroundColor: Color(0xff3DDC97),
      appBar: AppBar(
        backgroundColor: Color(0xff3DDC97),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //ask if the user is a tutor or a student
            Text(
              "What are you?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w900),
            ),
            Card(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(60))),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.20,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 15,
                      child: RaisedButton(
                        child: Text(
                          "TUTOR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        onPressed: () {
                          print(choice);
                          // setState(() => choice = "tutor");
                          setState(() {
                            
                          });
                          choice = "tutor";
                          print(choice);
                        },
                        color: Color(0xff256EFF),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(60))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 50),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 15,
                      child: RaisedButton(
                        child: Text(
                          "STUDENT",
                          style: TextStyle(color: Colors.white,
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        onPressed: () {},
                        color: Color(0xff256EFF),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(60))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    }
    
  }
}
