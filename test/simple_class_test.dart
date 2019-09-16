// import "package:jsonable/jsonable.dart";

// class Person with mixinJsonable {
//   Person({String name, String surname}) {
//     this.name = this.jString("name", initialValue: name);
//     this.surname = this.jString("surname", initialValue: surname);
//   }
//   Jstring name;
//   Jstring surname;
// }

// main() {
//   String json = """
//      {
//        "name": "Nico",
//        "surname": "Surname"
//      }
//   """;
//   var p = Person(name: "nico", surname: "spina");

//   print(p.toMap());

//   p.fromJson(json);
//   print(p.toMap());
// }
