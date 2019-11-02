import "../example/lib/exmaple_validation/required_validation.dart";

import "package:jsonable/jsonable.dart";
import "package:test/test.dart";

main() {
  group("required test", () {
    var p = SingUp();
    p.fromMap({"cookie": false});
    test("required test", () {
      var l = p.cookie.validate();
      expect(l.length, 1);
      expect(l[0], isA<RequiredRuleExcpetion>());
    });
  });
  group("required with test", () {
    var p = SingUp();
    p.fromMap({
      "name": "Nico",
      "surname": "",
    });
    test("required without surname", () {
      var lName = p.name.validate();
      expect(lName.length, 1);
      expect(lName[0], isA<RequiredWithRuleExcpetion>());
    });
  });

  group("required WithOut", () {
    var p = SingUp();
    p.fromMap({"name": "", "surname": "", "denomination": ""});
    test("error required Without", () {
      var l = p.denomination.validate();
      expect(l.length, 1);
      expect(l[0], isA<RequiredWithoutRuleExcpetion>());
    });
    test("no error requiredWithOut", () {
      p.fromMap({"name": "", "surname": "", "denomination": "hello"});
      var l = p.denomination.validate();
      expect(l.length, 0);
    });
  });
}
