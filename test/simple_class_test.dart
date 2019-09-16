import "package:jsonable/jsonable.dart";

class Person with mixinJsonable {
  Person({String name, String surname}) {
    this.name = this.jString("name", initialValue: name);
    this.surname = this.jString("surname", initialValue: surname);
  }
  Jstring name;
  Jstring surname;
}

main() {
  var p = Person(name: "nico", surname: "spina");
  var result = p.toMap();
  print(result);
}
