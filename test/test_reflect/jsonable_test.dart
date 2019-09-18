import 'dart:convert';

import "package:test/test.dart";
import "package:jsonable/withReflect/jsonable_reflect.dart";

class Person extends JsonableReflect {
  final String name;
  final String surname;
  Person({this.name: "ugo", this.surname: "rossi"});
  toString() => "null";
}

class MyTestWithNormalList extends JsonableReflect {
  List<String> l = ["hello", "world"];
}

class myTestWithListOfJsonable extends JsonableReflect {
  List<Person> contacts = [
    Person(name: "Mario", surname: "Bross"),
    Person(name: "Mark", surname: "Zuckerberg"),
    Person(name: "Elon", surname: "Musk")
  ];
}

List<JsonableReflect> persons = [
  Person(name: "Mario", surname: "Bross"),
  Person(name: "Mark", surname: "Zuckerberg"),
  Person(name: "Elon", surname: "Musk")
];

class Composed extends JsonableReflect {
  var person = Person(name: "Mario", surname: "Rossi");
}

main() {
  var person = Person();
  var withList = MyTestWithNormalList();
  var jsonableList = myTestWithListOfJsonable();
  var composed = Composed();
  group("jsonable class test", () {
    test("toJson it work?", () {
      var s = jsonEncode({"name": "ugo", "surname": "rossi"});
      expect(person.toJson(), s);
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

    test("jsonable composed class", () {
      var s = jsonEncode({
        "person": {"name": "Mario", "surname": "Rossi"},
      });
      expect(composed.toJson(), s);
    });
  });

  group("function jsonable()", () {
    test("basilar class ", () {
      var s = jsonEncode({"name": "ugo", "surname": "rossi"});
      expect(jsonable(person), s);
    });

    test(" list of Jsonable", () {
      var s = jsonEncode([
        {"name": "Mario", "surname": "Bross"},
        {"name": "Mark", "surname": "Zuckerberg"},
        {"name": "Elon", "surname": "Musk"},
      ]);
      expect(jsonable(persons), s);
    });

    test("jsonable Map of Jsonable", () {
      var s = jsonEncode({
        "mario": {"name": "Mario", "surname": "Bross"},
        "mark": {"name": "Mark", "surname": "Zuckerberg"}
      });
      expect(
          jsonable({
            "mario": Person(name: "Mario", surname: "Bross"),
            "mark": Person(name: "Mark", surname: "Zuckerberg")
          }),
          s);
    });
  });
}
