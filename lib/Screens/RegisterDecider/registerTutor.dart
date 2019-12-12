import 'package:dp_tutors/Services/auth.dart';
import 'package:dp_tutors/Services/database.dart';
import 'package:dp_tutors/models/user.dart';
import 'package:dp_tutors/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterTutor extends StatefulWidget {
  @override
  _RegisterTutorState createState() => _RegisterTutorState();
}

class _RegisterTutorState extends State<RegisterTutor> {
  int selectedColor = 0xff256EFF;

  toggleColor() {
    if (selectedColor == 0xff256EFF) {
      selectedColor = 0xff3DDC97;
    } else {
      selectedColor = 0xff256EFF;
    }
  }

  bool loading = false;

  final _formkey = GlobalKey<FormState>();
  final _database = DatabaseService();
  final _auth = AuthService();
  String firstname = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return loading ? Loading() : Scaffold(
      backgroundColor: Color(0xff3DDC97),
      appBar: AppBar(
        backgroundColor: Color(0xff3DDC97),
      ),
      body: Center(
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 100),
          height: 500,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(new Radius.circular(60))),
            child: Column(
              children: <Widget>[
                Form(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    margin: EdgeInsets.only(top: 100),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (val) => val.isEmpty ? "Enter a Name" : null,
                            decoration: InputDecoration(hintText: "First Name"),
                            onChanged: (val) {
                                        setState(() => firstname = val);
                                      },
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                //stores all the classes you can choose from
                                GestureDetector(
                                  onTap: () => print("2100 Tapped"),
                                  child: Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      height: 75,
                                      child: Card(
                                        child: Container(
                                          margin: EdgeInsets.only(top: 22),
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "CSCE 2100:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        shape: ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                new Radius.circular(0))),
                                        color: Colors.blue,
                                        elevation: 10,
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      toggleColor();
                                    });

                                    print("2110 Tapped");
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      height: 75,
                                      child: Card(
                                        child: Container(
                                          margin: EdgeInsets.only(top: 22),
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "CSCE 2110:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        shape: ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                new Radius.circular(0))),
                                        color: Color(selectedColor),
                                        elevation: 10,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                    if(_formkey.currentState.validate()){
                      // setState(() => loading = true);
                      List<String> clas = ["hello"];
                      await _database.registerTutor(user, firstname, clas);
                      
                    } else {
                      loading = false;
                    }
                  },
                  color: Color(0xff256EFF),
                  child: Text("Sign Up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
