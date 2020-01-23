import 'package:dp_tutors/Screens/LoggedIn/ratinglist.dart';
import 'package:dp_tutors/Screens/LoggedIn/tutors.dart';
import 'package:dp_tutors/Screens/LoggedIn/tutorsclasslist.dart';
import 'package:dp_tutors/models/user.dart';
import 'package:flutter/material.dart';


class TutorClass extends StatelessWidget {
  final Tutor tutor;
  // final String tutorname;
  // final String docid;
  // final List<String> tutorsclasses;
  TutorClass({this.tutor});
  @override
  Widget build(BuildContext context) {
    print("hahhehehfadhfadfha");
    print(tutor.classes);
    String tutorRate;
        return Scaffold(
          
          backgroundColor: Color(0xff3DDC97),
          appBar: AppBar(
                  backgroundColor: Color(0xff7211E0),
                  // Here we take the value from the MyHomePage object that was created by
                  // the App.build method, and use it to set our appbar title.
                  title: Text(tutor.firstName),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 40,),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 75,
                ),
                SizedBox(height: 20,),
                Text(
                  "Classes Taken",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w800
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 300,
                    child: TutorsClassList(classes: tutor.classes)
                  )
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        // SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                
                                Text(
                                  "Rating: ",
                                  style: TextStyle(
                                    
                                    fontSize: 40,
                                    color: Color(0xffFCFCFC),
                                    fontWeight: FontWeight.w800
                                  ),
                                ),
                                Expanded(
                                  child: RatingsList(),
                                ),
                                
                                // Icon(
                                //   Icons.star,
                                //   size: 40,
                                //   color: Colors.amber[300],
                                // ),
                                // Icon(
                                //   Icons.star,
                                //   size: 40,
                                //   color: Colors.amber[300],
                                // )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        // Text(
                        //   "BIO: ",
                        //   style: TextStyle(
                        //     fontSize: 40,
                        //     color: Color(0xffFCFCFC),
                        //     fontWeight: FontWeight.w800
                        //   ),
                        // ),
                        // SizedBox(height: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: Text(
                            ("RATE P/H: ${tutor.rate}")
                      ),
                      // child: Card(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.all(new Radius.circular(0))
                      //   ),

                      // ),
                    )
                  ],
                ),
              ),
              
              
            )
            
            
            
          ]
        )
      )
    );
  }
}