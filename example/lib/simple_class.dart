import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  late JString name;
  late JString surname;
  Person({String? name, String? surname}) {
    this.name = jString("name", initialValue: name);
    this.surname = jString("surname", initialValue: surname);
  }
}
