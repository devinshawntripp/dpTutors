import 'package:dp_tutors/Screens/LoggedIn/tutors.dart';
import 'package:dp_tutors/Services/database.dart';
import 'package:dp_tutors/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Authenticate/signinandregister.dart';
import 'RegisterDecider/register.dart';


class wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final user = Provider.of<User>(context);
    // final userdata = Provider.of<UserData>(context);
    print(user);
    // print("the user data is " + userdata.toString());


    //either return the sign in and register widget or return the Tutors widget
    if(user == null){
      return SignIn();
    } else {
      // if(clickedRegister == true){
      //   return Register();
      // } else {
        return StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userdata ,
          builder: (context, snapshot) {

            print(snapshot);
            if(snapshot.hasData){
              return Tutors();
            } else {
              return Register();

            }
          },
        );
        // if(userdata.firstName == null){
        //   //send them to the register page
        //   return Register();
        // } else {
        //   return Tutors();
        // }
        //need to get the data for the user and if it returns null
      // }

    }
    
  }
}