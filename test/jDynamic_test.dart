import 'package:test/test.dart';

import "../example/jDynamic.dart";

main() {
  group("jdynamic", () {
    var p = Person();
    var m = {"name": "Mario", "surname": "Bross"};
    p.fromMap(m);
    test("jdynamic clas", () {
      expect(p.name.get, "Mario");
      expect(p.surname.get, "Bross");
    });
  });
}
