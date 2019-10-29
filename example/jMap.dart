import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  JMap tags;
  JMap<String, Contact> contacts;
  Person() {
    this.tags = jMap("tags");
    this.contacts = jMap<String, Contact>("contacts", builder: () => Contact());
  }
}

class Contact with Jsonable {
  JString name;
  JString number;
  Contact() {
    name = jString("name");
    number = jString("number");
  }
}