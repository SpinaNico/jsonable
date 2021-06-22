import 'dart:convert';

import 'package:jsonable/jsonable.dart';
import "package:test/test.dart";

class Person with Jsonable {
  late JBool ok;
  late JString name;
  late JString surname;
  late JNum years;
  late JNum height;

  Person() {
    ok = jBool("ok");
    name = jString("name");
    surname = jString("surname");
    years = jNum("years");
    height = jNum("height");
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
