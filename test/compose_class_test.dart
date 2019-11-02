import 'dart:convert';

import "package:test/test.dart";

import '../example/lib/JList.dart';

main() {
  String source = """
    {
      "name": "Nico",
      "surname": "Spina",
      "tags": ["ciao", "mondo"],
      "permisions":{
        "role": "CTO",
        "permisions": [
         { "type": "admin",
          "description": "complete controll"}
        ]
      }
    }
  """;
  group("test fromJson", () {
    var p = Person();
    p.fromJson(source);
    test("test name", () => expect(p.name.value, "Nico"));
    test("test surname", () => expect(p.surname.value, "Spina"));
    test(
        "test permisions",
        () =>
            expect(p.permissions.value.runtimeType, Permisions().runtimeType));
    test("test permisions role",
        () => expect(p.permissions.value.role.value, "CTO"));
    test("test permision length", () {
      expect(p.permissions.value.permisions.value.length, 1);
    });
    test("test permision type is admin", () {
      expect(p.permissions.value.permisions.value[0].type.value, "admin");
    });
    test("test permision description ", () {
      expect(p.permissions.value.permisions.value[0].description.value,
          "complete controll");
    });

    test("To json Test", () {
      var m = jsonEncode(jsonDecode(source));

      expect(p.toJson(), m);
    });
  });
}
