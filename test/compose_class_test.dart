import 'dart:convert';
import 'package:jsonable/jsonable.dart';
import "package:test/test.dart";

class Person with Jsonable {
  Jstring name;
  Jstring surname;
  Jclass<Permisions> permissions;
  Jlist tags;
  Person() {
    this.name = this.jString("name");
    this.surname = this.jString("surname");
    this.tags = this.jList<String>("tags");
    this.permissions =
        this.jClass<Permisions>("permisions", () => Permisions());
  }
}

class Permisions with Jsonable {
  Jstring role;
  Jlist<Permision> permisions;

  Permisions() {
    this.role = this.jString("role");
    this.permisions =
        this.jList<Permision>("permisions", constructor: () => Permision());
  }
}

class Permision with Jsonable {
  Jstring type;
  Jstring description;
  Permision() {
    this.type = this.jString("type");
    this.description = this.jString("description");
  }
}

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
