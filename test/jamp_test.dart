import "package:test/test.dart";

import "../example/lib/jMap.dart";

main() {
  group("test of jMap", () {
    var m = {
      "tags": {
        "1": {"map": "map"},
        "2": {"test": "test"}
      },
      "contacts": {
        "mario": {"name": "Mario", "number": "+09345555"},
        "super": {"name": "super", "number": "+455546"}
      }
    };
    var j = Person();
    j.fromMap(m);
    test("tags test", () {
      expect(j.tags.value!["1"]["map"], "map");
      expect(j.tags.value!["2"]["test"], "test");
    });
    test("contacts", () {
      expect(j.contacts["mario"]!.name.value, "Mario");
      expect(j.contacts["super"]!.name.value, "super");
    });
  });
}
