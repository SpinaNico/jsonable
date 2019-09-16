import "package:jsonable/jsonable.dart";

class Person with mixinJsonable {
  Person() {
    this.name = this.jString("name");
    this.surname = this.jString("surname");
  }
  Jstring name;
  Jstring surname;
  List contact = [];
  addContact() {
    this.contact.add(Contact());
  }
}

class Contact with mixinJsonable {
  Contact({String name, String surname}) {
    this.name = this.jString("name", initialValue: name);
    this.surname = this.jString("surname", initialValue: surname);
  }

  Jstring name;
  Jstring surname;
}

main() {}
