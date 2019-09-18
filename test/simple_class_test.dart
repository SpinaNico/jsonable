import 'dart:convert';

import "package:jsonable/jsonable.dart";
import 'package:test/test.dart';

class Person with Jsonable {
  Jstring name;
  Jstring surname;
  Person({String name, String surname}) {
    this.name = this.jString("name", initialValue: name);
    this.surname = this.jString("surname", initialValue: surname);
  }
}

main() {
  String json = """
     {
       "name": "Nico",
       "surname": "Spina"
     }
  """;
  group(" simple class Instnce class it work?", () {
    group("constructor value", () {
      var p = Person(name: "nico", surname: "spina");
      test("", () {
        expect(p.name.value, "nico");
      });
      test("", () {
        expect(p.surname.value, "spina");
      });
    });
    group("toMap()", () {
      var p = Person(name: "Nico", surname: "Spina");
      var mapped = p.toMap();
      test("value", () {
        expect(p.name.value, mapped["name"]);
        expect(p.surname.value, mapped["surname"]);
      });
    });
    group("fromMap", () {
      var mapped = jsonDecode(json);
      var p = Person();
      p.fromMap(mapped);
      test("value", () {
        expect(p.name.value, mapped["name"]);
        expect(p.surname.value, mapped["surname"]);
      });
    });
  });
}
