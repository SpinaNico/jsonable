import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  JNum id;
  JMap<String, JClass<Contact>> contact;
  Person({id, contact}) {
    this.id = this.jNum("id", initialValue: id);
    this.contact = this.jMap<String, JClass<Contact>>(
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
    this.price = this.jNum("price", initialValue: price);
    this.title = this.jString("title", initialValue: title);
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
