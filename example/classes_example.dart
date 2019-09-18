import "package:jsonable/withReflect/jsonable_reflect.dart";

class Contact extends JsonableReflect {
  String name;
  String surname;
  Contact({this.name, this.surname});
}

class Person extends JsonableReflect {
  String name = "Mark";
  String surname = "Zuckerberg";
  List<Contact> contacts = [
    Contact(name: "Mario", surname: "Bross"),
    Contact(name: "Elon", surname: "Musk")
  ];
}

main() {
  var result = jsonable(Person());
  print(result);
  print(Person().toJson());
}
