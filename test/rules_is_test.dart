import 'package:jsonable/jsonable.dart';
import 'package:test/test.dart';
import "../example/lib/exmaple_validation/is_example.dart";

main() {
  group("is tests", () {
    group("email ", () {
      var f = Form();
      test("it work", () {
        f.fromMap({"email": "hello@hello.it"});
        var l = f.email.validate();
        expect(l.length, 0);
      });
      test("error test", () {
        f.fromMap({"email": "hellohello.it"});
        var l = f.email.validate();
        expect(l.length, 1);
        expect(l[0], isA<IsEmailRuleExcpetion>());
      });
    });

    group("datetime test", () {
      var p = Form();
      test("it work", () {
        p.fromMap({"date": "2019-10-04"});
        var l = p.date.validate();
        expect(l.length, 0);
      });

      test("error ", () {
        p.fromMap({"date": "2019-10-0x"});
        var l = p.date.validate();
        expect(l.length, 1);
        expect(l[0], isA<IsDateTimeRuleExcpetion>());
      });
    });

    group("is numbers: int, double, num", () {
      var p = Form();

      test("is float/number it work?", () {
        p.fromMap({"float": "12.4"});
        var l = p.float.validate();
        expect(l.length, 0);
      });
    });
  });
}
