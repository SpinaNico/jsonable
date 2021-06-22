import 'package:jsonable/src/typing/CJlist.dart';
import 'package:test/test.dart';

void main() {
  group("funxtion test", () {
    test("add", () {
      var list = CJlist<String>(
        null,
        "list",
      );
      list.add("ex1");
      expect(list.length, 1);
      expect(list.last, "ex1");

      list.add("ex2");
      expect(list.length, 2);
      expect(list.last, "ex2");

      list.add("ex3");
      expect(list.length, 3);
      expect(list.last, "ex3");
    });

    test("removeAt", () {
      var list = CJlist<String?>(null, "list",
          initialValue: ["example1", "example2", "example3"]);

      expect(list.removeAt(1), "example2");
      expect(list.length, 2);
      expect(list.last, "example3");
    });
  });
}
