import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  late JString name;
  late JString surname;
  late JList<Contact?> contact;
  late JList tags;
  Person() {
    name = jString("name");
    surname = jString("surname");
    tags = jList("tags");
    contact = jList<Contact>("contacts", builder: () => Contact());
  }
}

class Contact with Jsonable {
  late JString name;
  late JString surname;
  Contact({String? name, String? surname}) {
    this.name = jString("name", initialValue: name);
    this.surname = jString("surname", initialValue: surname);
  }
}
