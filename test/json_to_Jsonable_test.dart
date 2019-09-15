import 'dart:convert';

import 'package:jsonable/jsonable.dart';
import "package:test/test.dart";

class Person extends Jsonable {
  String name;
  String surname;
}

class Composed extends Jsonable {
  Person contact = Person();
}

main() {
  group("test of class Jsonable", () {
    group("simple class", () {
      String j = jsonEncode({"name": "Nico", "surname": "Spina"});
      Person p = Person();
      p.fromJson(j);
      test("name is correct", () {
        expect(p.name, "Nico");
      });
      test("surname is correct", () {
        expect(p.surname, "Spina");
      });
    });

    group("composed class", () {
      String j = jsonEncode({
        "contact": {"name": "Nico", "surname": "Spina"}
      });
      Composed p = Composed();
      p.fromJson(j);
      test("contact.name", () {
        expect(p.contact.name, "Nico");
      });
      test("contact.surname", () {
        expect(p.contact.surname, "Spina");
      });
    });
  });
}
