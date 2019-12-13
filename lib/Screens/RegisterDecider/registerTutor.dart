import 'package:dp_tutors/Screens/RegisterDecider/classlist.dart';
import 'package:dp_tutors/Screens/RegisterDecider/classtile.dart';
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
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 100),
          height: 300,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(new Radius.circular(60))),
            child: Column(
              children: <Widget>[

                  
                  
                  Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    margin: EdgeInsets.only(top: 50, bottom: 0),
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("Pick the classes you have taken"),
                  Expanded(
                    child: ClassList(),
                  ),
                RaisedButton(
                  onPressed: () async {
                    if(_formkey.currentState.validate()){
                      setState(() => loading = true);
                      await _database.registerTutor(user, firstname, takenClasses);
                      takenClasses = [];
                      
                    } else {
                      loading = false;
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(new Radius.circular(60))
                  ),
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
