import 'package:flutter/material.dart';
import './Authenticate/signinandregister.dart';


class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    //either return the sign in and register widget or return the Tutors widget
    return SignIn();
  }
}