import "package:jsonable/jsonable.dart";

class Contact extends Jsonable {
  String name;
  String surname;
  Contact({this.name, this.surname});
}

class Person extends Jsonable {
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
