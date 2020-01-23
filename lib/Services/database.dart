import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dp_tutors/Services/auth.dart';
import 'package:dp_tutors/models/user.dart';



class DatabaseService {

  final String uid;

  //constructor
  DatabaseService({this.uid});


  final tutorsCollection = Firestore.instance.collection("Tutors");
  final AuthService _auth = AuthService();


  Future getUserName(User user) async {
    await tutorsCollection.document(user.uid).get();
  }

  Future registerTutor(User user, String firstname, List<String> classes, int rate) async {
    return await tutorsCollection.document(user.uid).setData({
      'firstname': firstname,
      'rating': 0,
      'classes': FieldValue.arrayUnion(classes),
      'rate': rate,
      

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


  

  List<Tutor> _tutorsListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      if(doc.data['classes'] != null){
          return Tutor(
            firstName: doc.data['firstname'] ?? '',
            rating: doc.data['rating'] ?? 0,
            docid: doc.documentID,
            classes: doc.data['classes'].cast<String>() ?? [],
            rate: doc.data['rate'] ?? 0,
          );
      } else {
        return Tutor(
            firstName: doc.data['firstname'] ?? '',
            rating: doc.data['rating'] ?? 0,
            docid: doc.documentID,
            classes: [],
            rate: doc.data['rate'] ?? 0,
          );
      }

      

    }).toList();
  }


  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData (
      firstName: snapshot.data['firstname'] ?? "",
      rating: snapshot.data['rating'] ?? ""
    );

  }

  Stream<UserData> get userdata {
    // print("some things " + uid);
    return tutorsCollection.document(uid).snapshots()
      .map((DocumentSnapshot userdata) => _userDataFromSnapshot(userdata));
  }

}