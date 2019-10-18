import 'dart:convert';

import 'package:test/test.dart';

import "../example/simple_class.dart";

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
        expect(p.name.get, "nico");
      });
      test("", () {
        expect(p.surname.get, "spina");
      });
    });
    group("toMap()", () {
      var p = Person(name: "Nico", surname: "Spina");
      var mapped = p.toMap();
      test("value", () {
        expect(p.name.get, mapped["name"]);
        expect(p.surname.get, mapped["surname"]);
      });
    });
    group("fromMap", () {
      var mapped = jsonDecode(json);
      var p = Person();
      p.fromMap(mapped);
      test("value", () {
        expect(p.name.get, mapped["name"]);
        expect(p.surname.get, mapped["surname"]);
      });
    });
  });
}
