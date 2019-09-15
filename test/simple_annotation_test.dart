import "package:test/test.dart";
import "package:jsonable/jsonable.dart";
import "dart:convert";

@JsonNote(keyName: "hello")
class Person {
  String name = "Giulia";

  @JsonNote(keyName: "surName")
  String surname = "Green";
  int get years => 2 + 2;
}

main() {
  group("jsoable function test", () {
    var p = Person();
    var s = jsonEncode({"name": "Giulia", "surName": "Green", "years": 4});
    test("testing keyName jsonNote", () {
      expect(jsonable(p), s);
    });
  });
}
