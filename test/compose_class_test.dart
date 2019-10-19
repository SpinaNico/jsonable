import 'dart:convert';

import "package:test/test.dart";

import '../example/JList.dart';

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
    test("test name", () => expect(p.name.get, "Nico"));
    test("test surname", () => expect(p.surname.get, "Spina"));
    test("test permisions",
        () => expect(p.permissions.get.runtimeType, Permisions().runtimeType));
    test("test permisions role",
        () => expect(p.permissions.get.role.get, "CTO"));
    test("test permision length", () {
      expect(p.permissions.get.permisions.get.length, 1);
    });
    test("test permision type is admin", () {
      expect(p.permissions.get.permisions.get[0].type.get, "admin");
    });
    test("test permision description ", () {
      expect(p.permissions.get.permisions.get[0].description.get,
          "complete controll");
    });

    test("To json Test", () {
      var m = jsonEncode(jsonDecode(source));

      expect(p.toJson(), m);
    });
  });
}
