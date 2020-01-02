import 'package:jsonable/src/validator/exceptions.dart';
import "package:test/test.dart";

import '../example/lib/exmaple_validation/custom_rule.dart';

main() {
  group("custom rule", () {
    var p = Person();

    test("it get error, example?", () {
      p.fromMap({"name": "Paolo"});
      var l = p.name.validate();
      expect(l.length, 1);
      expect(l[0], isA<RuleException>());
    });

    test("it work, example?", () {
      p.fromMap({"name": "Nico"});
      var l = p.name.validate();
      expect(l.length, 0);
    });
  });
}
