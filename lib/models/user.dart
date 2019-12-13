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

  Tutor({this.firstName, this.rating});
}

final List<String> classes = ["CSCE 2100","CSCE 2110", "Automata Theory"];

// class EngClass {
//   final String name;
//   final String eng
// }

List<String> takenClasses = [];
