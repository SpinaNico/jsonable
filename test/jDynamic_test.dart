import 'package:test/test.dart';

import "../example/lib/jDynamic.dart";

main() {
  group("jdynamic", () {
    var p = Person();
    var m = {"name": "Mario", "surname": "Bross"};
    p.fromMap(m);
    test("jdynamic clas", () {
      expect(p.name.value, "Mario");
      expect(p.surname.value, "Bross");
    });
  });
}
