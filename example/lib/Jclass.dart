import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  JString name;
  JString surname;
  JList<Contact> contact;
  JList tags;
  Person() {
    name = jString("name");
    surname = jString("surname");
    tags = jList("tags");
    contact = jList<Contact>("contacts", builder: () => Contact());
  }
}

class Contact with Jsonable {
  JString name;
  JString surname;
  Contact({String name, String surname}) {
    this.name = jString("name", initialValue: name);
    this.surname = jString("surname", initialValue: surname);
  }
}
