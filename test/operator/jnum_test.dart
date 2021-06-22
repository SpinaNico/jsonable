import 'package:jsonable/jsonable.dart';
import "package:test/test.dart";

class AA with Jsonable {
  late JNum a;
  late JNum b;
  AA() {
    a = jNum("a");
    b = jNum("b");
  }
}

void main() {
  group("test add operator", () {
    var aa = AA()..fromMap({"a": 10, "b": 20});

    test("Jnum(10) + 5", () {
      var q = aa.a + 5;
      expect(q, isA<num>());
      expect(q, 15);
    });

    test("Jnum(10) + Jnum(20)", () {
      expect(aa.a + aa.b, 30);
    });
  });

  group("test multiply operator", () {
    var aa = AA()..fromMap({"a": 10, "b": 3});

    test("jnum * num", () {
      expect(aa.a * 3, 30);
    });
    test("jnum * jnum", () {
      expect(aa.a * aa.b, 30);
    });
  });

  group("test divison integer operator", () {
    var aa = AA()..fromMap({"a": 10, "b": 3});

    test("jnum ~/ num", () {
      expect(aa.a ~/ 3, 3);
    });
    test("jnum ~/ jnum", () {
      expect(aa.a ~/ aa.b, 3);
    });
  });
  group("test division double operator", () {
    var aa = AA()..fromMap({"a": 10, "b": 5});

    test("jnum / num", () {
      expect(aa.a / 5, 2);
    });

    test("jnum / jnum", () {
      expect(aa.a / aa.b, 2);
    });
  });
  group("test module operator", () {
    var aa = AA()..fromMap({"a": 15, "b": 4});
    test("jnum % num ", () {
      expect(aa.a % 4, 3);
    });
    test("jnum % jnum", () {
      expect(aa.a % aa.b, 3);
    });
  });

  group("logic test operations", () {
    group("test == operator", () {
      var aa = AA()..fromMap({"a": 10, "b": 10});

      test("jnum == num", () {
        expect(aa.a == 20, false);
      });
      test("jnum == jnum", () {
        expect(aa.a == aa.b, true);
      });

      test("jnum != jnum", () {
        expect(aa.a != aa.b, false);
      });
    });
    group("test < operator", () {
      var aa = AA()..fromMap({"a": 10, "b": 20});

      test("jnum < num", () {
        expect(aa.a < 3, false);
      });
      test("jnum < jnum", () {
        expect(aa.a < aa.b, true);
      });
    });

    group("test > operator", () {
      var aa = AA()..fromMap({"a": 10, "b": 20});

      test("jnum > num", () {
        expect(aa.a > 3, true);
      });
      test("jnum > jnum", () {
        expect(aa.a > aa.b, false);
      });
    });

    group("test >= operator", () {
      var aa = AA()..fromMap({"a": 20, "b": 20});
      test("jnum  >= num", () {
        expect(aa.a >= 30, false);
      });
      test("jnum >= jnum", () {
        expect(aa.a >= aa.b, true);
      });
    });

    group("test <= operator", () {
      var aa = AA()..fromMap({"a": 20, "b": 20});
      test("jnum  <= num", () {
        expect(aa.a <= 30, true);
      });
      test("jnum <= jnum", () {
        expect(aa.a <= aa.b, true);
      });
    });
  });
}
