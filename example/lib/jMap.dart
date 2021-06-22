import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  late JMap tags;
  late JMap<String?, Contact?> contacts;
  Person() {
    tags = jMap("tags");
    contacts = jMap<String, Contact>("contacts", builder: () => Contact());
  }
}

class Contact with Jsonable {
  late JString name;
  late JString number;
  Contact() {
    name = jString("name");
    number = jString("number");
  }
}
