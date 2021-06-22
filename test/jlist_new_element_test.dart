import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/mixin_jsonable.dart';
import 'package:test/test.dart';

class Contact with Jsonable {
  late JString name;
  late JString phone;
  Contact() {
    name = jString("name");
    phone = jString("phone");
  }
}

class Contacts with Jsonable {
  late JList<Contact?> contacts;
  Contacts() {
    contacts = jList("contacts", builder: () => Contact());
  }
}

void main() {
  var m = {
    "contacts": [
      {
        "name": "mario",
        "phone": "+304839",
      },
      {
        "name": "mario",
        "phone": "+304839",
      },
      {
        "name": "mario",
        "phone": "+304839",
      },
    ]
  };
  var c = Contacts()..fromMap(m);

  group("test hashcode", () {
    test("same id", () {
      var v = c.contacts[0].hashCode;
      c.fromMap(m);
      expect(c.contacts[0].hashCode, v);
    });

    test("lenght check", () {
      var v = c.contacts.length;
      c.fromMap(m);
      expect(c.contacts.length, v);
    });
  });
}
