import "../example/simpleComparision.dart";
import 'package:test/test.dart';

main() {
  group("test controll if expression num, string>", () {
    var n = MyData();

    test("test num == if", () {
      if (n.num1 == 1) {
        expect(true, true);
      } else {
        expect(false, true);
      }
    });

    test("test num != if", () {
      if (n.num2 != n.num1) {
        expect(true, true);
      } else {
        expect(false, true);
      }
    });
    test("test string == if", () {
      if (n.string1 == "hello") {
        expect(true, true);
      } else {
        expect("${n.string2}, ${n.string1}", true);
      }
    });
    test("test string != if", () {
      if (n.string2 != n.string1) {
        expect(true, true);
      } else {
        expect("${n.string2}, ${n.string1}", true);
      }
    });

    group("test example", () {
      test("comparateN1andN2", () => expect(n.comparateN1andN2(), false));
      test("comparateN1andN2", () => expect(n.compareJNum1and2(), false));
      test("comparateN1andN2", () => expect(n.compareJnum3and1(), true));
    });
  });
}
