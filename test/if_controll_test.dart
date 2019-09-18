import 'package:jsonable/jsonable.dart';
import 'package:test/test.dart';

class MyData with Jsonable {
  Jnum num1;
  Jnum num2;
  Jstring string1;
  Jstring string2;
  MyData() {
    this.num1 = this.jNum("num1", initialValue: 1);
    this.num2 = this.jNum("num2", initialValue: 2);
    this.string1 = this.jString("keyname", initialValue: "hello");
    this.string2 = this.jString("keyname", initialValue: "ciao");
  }
}

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
  });
}
