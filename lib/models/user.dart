class User {
  final String uid;



  User( {this.uid} );

}

class UserData {


  final String firstName;
  final int rating;


  UserData( {this.firstName, this.rating } );

}

class Tutor {
  final String firstName;
  final int rating;
  final String docid;
  final int rate;
  final List<String> classes;

  Tutor({this.firstName, this.rating, this.docid, this.classes, this.rate});
}

final List<String> classes = ["CSCE 2100","CSCE 2110", "Automata Theory"];

// class EngClass {
//   final String name;
//   final String eng
// }

List<String> takenClasses = [];

List<String> selectedUserClasses = [];
