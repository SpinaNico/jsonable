import "package:jsonable/jsonable.dart";
import "package:test/test.dart";

class Person with Jsonable {
  Jstring name;
  Jstring surname;
  Jlist<Contact> contact;
  Jlist tags;
  Person() {
    this.name = this.jString("name");
    this.surname = this.jString("surname");
    this.tags = this.jList<String>("tags");
    this.contact =
        this.jList<Contact>("contacts", constructor: () => Contact());
  }
}

class Contact with Jsonable {
  Jstring name;
  Jstring surname;
  Contact({String name, String surname}) {
    this.name = this.jString("name", initialValue: name);
    this.surname = this.jString("surname", initialValue: surname);
  }
}

main() {
  var fakeJson = """
    {
      "name": "Mark",
      "surname": "Zuckerberg",
      "tags":["hello","world"],
      "contacts":[
        {"name": "Elon", "surname": "Musk"}
        ]
    }
  """;
  var p = Person();
  p.fromJson(fakeJson);
  group("controll compose class with contact Jlist<Contact>", () {
    test("list contact is 1?", () {
      expect(p.contact.length, 1);
    });
    test("list contain Elon Musk?", () {
      if (p.contact.length > 0) {
        expect(p.contact[0].name.value, "Elon");
        expect(p.contact[0].surname.value, "Musk");
      }
    });
  });
}
