import 'dart:convert';

import "package:test/test.dart";
import "package:jsonable/jsonable.dart";

import 'simple_annotation_test.dart';

class Person extends Jsonable {
  final String name;
  final String surname;
  Person({this.name: "ugo", this.surname: "rossi"});
  toString() => "null";
}

class MyTestWithNormalList extends Jsonable {
  List<String> l = ["hello", "world"];
}

class myTestWithListOfJsonable extends Jsonable {
  List<Person> contacts = [
    Person(name: "Mario", surname: "Bross"),
    Person(name: "Mark", surname: "Zuckerberg"),
    Person(name: "Elon", surname: "Musk")
  ];
}

main() {
  group("jsonable test", () {
    var c = Person();
    var withList = MyTestWithNormalList();
    var jsonableList = myTestWithListOfJsonable();
    test("toJson it work?", () {
      var s = jsonEncode({"name": "ugo", "surname": "rossi"});
      expect(c.toJson(), s);
    });

    test("json with normal list", () {
      var s = jsonEncode({
        "l": ["hello", "world"]
      });
      expect(withList.toJson(), s);
    });

    test("json with jsonable list", () {
      var s = jsonEncode({
        "contacts": [
          {"name": "Mario", "surname": "Bross"},
          {"name": "Mark", "surname": "Zuckerberg"},
          {"name": "Elon", "surname": "Musk"},
        ]
      });
      expect(jsonableList.toJson(), s);
    });
  });
}
