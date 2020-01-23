import 'package:dp_tutors/Screens/RegisterDecider/register.dart';
import 'package:dp_tutors/Services/auth.dart';
import 'package:dp_tutors/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //form field state
  String email = '';
  String password = '';
  String error = '';

  bool loading = false;

  double cardHeight = 0.30;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Color(0xff7211E0),
            //   // Here we take the value from the MyHomePage object that was created by
            //   // the App.build method, and use it to set our appbar title.
            //   title: Text(widget.title),
            // ),
            body: Center(
              child: Container(
                  child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
                    child: Text(
                      "DISCOVERY TUTORS",
                      style: new TextStyle(
                        color: Color(0xffFCFCFC),
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                      ),
                      textScaleFactor: 2.5,
                    ),
                  ),
                  Container(
                    //add logo
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Image.asset(
                      'assets/Unt-Logo.png',
                      height: 100,
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/),
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .05),
                    height: (MediaQuery.of(context).size.height * cardHeight * 1),
                    width: MediaQuery.of(context).size.width * .90,
                    child: Card(
                      elevation: 15,
                      color: Color(0xffFCFCFC),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(new Radius.circular(60))),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Form(
                              key: _formkey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03) ,
                                    width: 300,
                                    child: TextFormField(
                                      validator: (val) =>
                                          val.isEmpty ? "Enter an email" : null,
                                      // style: new TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        // hintStyle: new TextStyle(color: Colors.white),
                                        hintText: "Email:",
                                      ),
                                      onChanged: (val) {
                                        setState(() => email = val);
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 25),
                                    width: 300,
                                    child: TextFormField(
                                      validator: (val) => val.length < 6
                                          ? "Enter a password that is 6 chars long"
                                          : null,
                                      // style: new TextStyle(color: Colors.white),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        // hintStyle: new TextStyle(color: Colors.white),
                                        hintText: "Password:",
                                      ),
                                      onChanged: (val) {
                                        setState(() {
                                          password = val;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 25),
                                    margin: EdgeInsets.only(left: 12),
                                    width: 100,
                                    height: 75,
                                    child: RaisedButton(
                                      onPressed: () async {
                                        if (_formkey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth.signInEAP(
                                              email, password);
                                          if(result == null){
                                            setState(() {
                                              error = "please enter valid credentials";
                                              loading = false;
                                            });
                                            
                                          } 
                                        } else {
                                          loading = false;
                                        }
                                      },
                                      child: Text(
                                        "Signin",
                                        style: new TextStyle(
                                            color: Color(0xffFCFCFC)),
                                      ),
                                      color: Color(0xff256EFF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              new Radius.circular(60))),
                                      elevation: 10,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 25),
                                    margin: EdgeInsets.only(left: 75),
                                    width: 100,
                                    height: 75,
                                    child: RaisedButton(
                                      onPressed: () async {
                                        //later see if anything is typed in and pass values through to register
                                        print("working");
                                
                                        if (_formkey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth.signUp(email, password);
                                          if(result == null){
                                            setState(() {
                                              error = "account is already in use";
                                              loading = false;
                                            });
                                          }
                                        } else {
                                          setState(() {
                                            cardHeight = cardHeight + 0.025;
                                            loading = false;
                                          });
                                        }
                                      },
                                      child: Text(
                                        "Signup",
                                        style: new TextStyle(
                                            color: Color(0xffFCFCFC)),
                                      ),
                                      color: Color(0xff256EFF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              new Radius.circular(60))),
                                      elevation: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12.0,),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () async {
                        await _auth.signInAnon();
                      },
                      child: Text(
                        "Facebook",
                        style: new TextStyle(
                          color: Color(0xffFCFCFC),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      color: Color(0xff256EFF),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(new Radius.circular(60))),
                      elevation: 10,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () async {
                        await _auth.signInAnon();
                      },
                      child: Text(
                        "Google",
                        style: new TextStyle(
                          color: Color(0xffFCFCFC),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      color: Color(0xff256EFF),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(new Radius.circular(60))),
                      elevation: 10,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () async {
                        dynamic result = await _auth.signInAnon();
                        if (result == Null) {
                          print("user not signed in");
                        } else {
                          print("user signed in");
                          print(result.uid);
                        }
                      },
                      child: Text(
                        "Guest",
                        style: new TextStyle(
                          color: Color(0xffFCFCFC),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      color: Color(0xff256EFF),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(new Radius.circular(60))),
                      elevation: 10,
                    ),
                  ),
                ],
              )),
            ),
            backgroundColor: Color(0xff3DDC97),
          );
  }
}
