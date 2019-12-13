import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dp_tutors/Services/auth.dart';
import 'package:dp_tutors/models/user.dart';



class DatabaseService {

  final String uid;

  //constructor
  DatabaseService({this.uid});


  final tutorsCollection = Firestore.instance.collection("Tutors");
  final AuthService _auth = AuthService();




  Future registerTutor(User user, String firstname, List<String> classes) async {
    return await tutorsCollection.document(user.uid).setData({
      'firstname': firstname,
      'rating': 0,
      'classes': FieldValue.arrayUnion(classes),
      

    });
    // for (var someclass in classes){
        
    // }

    // return await tutorsCollection.document(user.uid).collection("classes").document().updateData({
    //   {"data": classes}
    // });
    
  }

  Future registerStudent() async {

  }

  Stream<List<Tutor>> get tutors {
    return tutorsCollection.snapshots()
    .map(_tutorsListFromSnapshot);
  }


  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData (
      firstName: snapshot.data['firstname'],
      rating: snapshot.data['rating']
    );

  }

  List<Tutor> _tutorsListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {

      return Tutor(
        firstName: doc.data['firstname'] ?? '',
        rating: doc.data['rating'] ?? 0,
      );

    }).toList();
  }

  Stream<UserData> get userdata {
    return tutorsCollection.document(uid).snapshots()
      .map((DocumentSnapshot userdata) => _userDataFromSnapshot(userdata));
  }

}