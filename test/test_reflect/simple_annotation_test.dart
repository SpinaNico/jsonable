import "package:test/test.dart";
import "package:jsonable/jsonable_reflect.dart";
import "dart:convert";

class Person {
  String name = "Giulia";
  @JsonNote(keyName: "surName")
  String surname = "Green";
  int get years => 2 + 2;
}

class PersonExclude {
  @JsonNote(exclude: true)
  String name = "Giulia";
  @JsonNote(keyName: "surName")
  String surname = "Green";
  int get years => 2 + 2;
}

main() {
  group("jsoable function test", () {
    test("testing keyName jsonNote", () {
      var s = jsonEncode({"name": "Giulia", "surName": "Green", "years": 4});
      expect(jsonable(Person()), s);
    });
    test("work exclude", () {
      var s = jsonEncode({"surName": "Green", "years": 4});
      expect(jsonable(PersonExclude()), s);
    });
  });
}
