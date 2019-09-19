import 'dart:convert';
import "../example/simple_class.dart";
import 'package:test/test.dart';

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
