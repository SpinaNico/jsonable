import "package:test/test.dart";

import "../example/jMap.dart";

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
      expect(j.tags.get["1"]["map"], "map");
      expect(j.tags.get["2"]["test"], "test");
    });
    test("contacts", () {
      expect(j.contacts["mario"].name.get, "Mario");
      expect(j.contacts["super"].name.get, "super");
    });
  });
}
