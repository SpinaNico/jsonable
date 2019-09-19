import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  JString name;
  JString surname;
  JList<Contact> contact;
  JList tags;
  Person() {
    this.name = this.jString("name");
    this.surname = this.jString("surname");
    this.tags = this.jList("tags");
    this.contact =
        this.jList<Contact>("contacts", constructor: () => Contact());
  }
}

class Contact with Jsonable {
  JString name;
  JString surname;
  Contact({String name, String surname}) {
    this.name = this.jString("name", initialValue: name);
    this.surname = this.jString("surname", initialValue: surname);
  }
}
