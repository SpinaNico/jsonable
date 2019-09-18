import 'dart:convert';

import 'package:jsonable/jsonable.dart';
import "package:test/test.dart";

class Person with Jsonable {
  Jbool ok;
  Jstring name;
  Jstring surname;
  Jnum years;
  Jnum height;

  Person() {
    this.ok = this.jBool("ok");
    this.name = this.jString("name");
    this.surname = this.jString("surname");
    this.years = this.jNum("years");
    this.height = this.jNum("height");
  }
}

main() {
  var mapped = jsonDecode("""{
    "name": "Nico",
    "surname": "Spina",
    "years": 25,
    "height": 1.80,
    "ok": true
  }
  """);
  group("testing all typing simple classe ", () {
    group("fromMap", () {
      var p = Person();
      p.fromMap(mapped);
      test("name", () => expect(p.name.value, "Nico"));
      test("surname", () => expect(p.surname.value, "Spina"));
      test("years", () => expect(p.years.value, 25));
      test("height", () => expect(p.height.value, 1.80));
      test("ok", () => expect(p.ok.value, true));
    });
  });
}
