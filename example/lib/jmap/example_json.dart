import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  JNum id;
  JMap<String, JClass<Contact>> contact;
  Person({id, contact}) {
    id = jNum("id", initialValue: id);
    contact = jMap<String, JClass<Contact>>(
      "contact",
      builder: () => Contact(),
      initialValue: contact,
    );
  }
}

class Contact with Jsonable {
  JNum price;
  JString title;
  Contact({price, title}) {
    price = jNum("price", initialValue: price);
    title = jString("title", initialValue: title);
  }
}

main() {
  var p = Person()
    ..fromMap({
      "id": 100,
      "contact": {
        'pc': {"price": 500, "title": 'a01'},
        'nb': {"price": 100, "title": 'b01'}
      }
    });
  print(p.toJson());

  var s =
      """{"id":100,"contact":{"pc":{"price":500,"title":"a01"},"nb":{"price":100,"title":"b01"}}}""";

  p.fromJson(s);
  print(p.toJson());
}
