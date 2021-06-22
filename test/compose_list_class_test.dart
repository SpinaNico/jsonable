import "package:test/test.dart";

import "../example/lib/Jclass.dart";

main() {
  var fakeJson = """
    {
      "name": "Mark",
      "surname": "Zuckerberg",
      "tags":["hello","world"],
      "contacts":[
        {"name": "Elon", "surname": "Musk"}, null, "sciao"
        ]
    }
  """;
  var p = Person();
  p.fromJson(fakeJson);
  group("controll compose class with contactJList<Contact>", () {
    test("list contact is 1?", () {
      expect(p.contact.length, 1);
    });
    test("list contain Elon Musk?", () {
      if (p.contact.isNotEmpty) {
        expect(p.contact[0]!.name.value, "Elon");
        expect(p.contact[0]!.surname.value, "Musk");
      }
    });
  });
}
