import "package:jsonable/jsonable.dart";
import "package:test/test.dart";

class Simple with Jsonable {
  JNum number1;
  JNum number2;

  JList list1;
  JList list2;

  JString string1;
  JString string2;

  Simple() {
    number1 = jNum("n1");
    number2 = jNum("n2");

    list1 = jList("l1");
    list2 = jList("l2");

    string1 = jString("s1");
    string2 = jString("s2");
  }
}

void main() {
  group("math tests", () {
    test("jNum tests", () {
      var s = Simple()
        ..fromMap({
          "n1": 3,
          "n2": 4,
        });

      expect(s.number1 + s.number2, 7);
      expect(s.number1 > s.number2, false);
      expect(s.number2 > s.number1, true);
      expect(s.number2 == s.number1, false);
      expect(s.number2 != s.number1, true);
    });

    test("jstring tests", () {
      var s = Simple()
        ..fromMap({
          "s1": "ciao ",
          "s2": "mondo",
        });

      expect(s.string1 + s.string2, "ciao mondo");
      expect(s.string1 + "mondo", "ciao mondo");
      expect(s.string1 == s.string2, false);
      expect(s.string1 == "ciao ", true);
      expect(s.string2 == s.string2, true);
    });

    test("jlist tests", () {
      var s = Simple()
        ..fromMap({
          "l1": [1, 2, 3],
          "l2": [4, 5, 6],
        });

      for (var i = 0; i < 6; i++) {
        expect(List.from(s.list1 + s.list2)[i] == [1, 2, 3, 4, 5, 6][i], true);
      }

      expect(s.list1 == s.list2, false);
      expect(s.list1 == s.list1, true);
      expect(s.list1 == [1, 2, 3], true);
    });
  });
}
