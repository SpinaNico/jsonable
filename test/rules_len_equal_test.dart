import 'package:jsonable/src/validator/exceptions.dart';
import "package:test/test.dart";
import "../example/exmaple_validation/len_equal_example.dart";

main() {
  group("rule equal tests, with errors", () {
    var p = Camp();

    p.fromMap({
      "number": 6,
      "message": "hi!",
      "boolean": false,
      "elements": [1, 2]
    });
    test("number in error", () {
      var l = p.number.validate();
      expect(l.length, 1);
      expect(l[0], isA<EqualRuleExcpetion>());
    });
    test("message in error", () {
      var l = p.message.validate();
      expect(l.length, 2);
      expect(l[0], isA<EqualRuleExcpetion>());
      expect(l[1], isA<LenRuleExcepeion>());
    });
    test("boolean in error", () {
      var l = p.boolean.validate();
      expect(l.length, 1);
      expect(l[0], isA<EqualRuleExcpetion>());
    });
    test("elements in error", () {
      var l = p.elements.validate();
      expect(l.length, 1);
      expect(l[0], isA<EqualRuleExcpetion>());
    });
  });

  group("equal test without errors", () {
    var p = Camp();

    p.fromMap({
      "message": "hello!",
      "boolean": true,
      "number": 5,
      "elements": [1, 2, 3]
    });
    test("message equal it work?", () {
      var l = p.message.validate();
      expect(l.length, 0);
    });
    test("boolean it work", () {
      var l = p.boolean.validate();
      expect(l.length, 0);
    });
    test("number it work", () {
      var l = p.number.validate();
      expect(l.length, 0);
    });
    test("eleements is work", () {
      var l = p.elements.validate();
      expect(l.length, 0);
    });
  });

  group("len test with error", () {});
}
