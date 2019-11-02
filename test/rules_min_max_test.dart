import "../example/exmaple_validation/simple_example.dart";

import 'package:jsonable/jsonable.dart';
import "package:test/test.dart";

main() {
  Person p = Person();
  group("test for rules min", () {
    p.fromMap({"name": "Mario", "surname": "Bross", "years": 14});
    test("test validation work correctly?", () {
      var l = p.years.validate();
      expect(l.length, 1);
      expect(l[0], isA<MinRuleException>());
    });
    test("test max", () {
      p.fromMap({"years": 110});
      var l = p.years.validate();
      expect(l.length, 1);
      expect(l[0], isA<MaxRuleExcpetion>());
    });

    test(" string min error", () {
      p.fromMap({"name": "dd"});
      var l = p.name.validate();
      expect(l.length, 1);
      expect(l[0], isA<MinRuleException>());
    });
    test(" string", () {
      p.fromMap({"name": "Mario"});
      var l = p.name.validate();
      expect(l.length, 0);
    });

    test("max string", () {
      p.fromMap({"name": "dd44444444444444ffdd"});
      var l = p.name.validate();
      expect(l.length, 1);
      expect(l[0], isA<MaxRuleExcpetion>());
    });
  });
}
