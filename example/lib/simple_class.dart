import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  JString name;
  JString surname;
  Person({String name, String surname}) {
    this.name = jString("name", initialValue: name);
    this.surname = jString("surname", initialValue: surname);
  }
}
