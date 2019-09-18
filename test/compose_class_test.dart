import "package:jsonable/jsonable.dart";

class Person with mixinJsonable {
  Jstring name;
  Jstring surname;
  Jlist<Jobject> contact;
  Jlist tags;
  Person() {
    this.name = this.jString("name");
    this.surname = this.jString("surname");
    this.tags = this.jList("tags");
    //this.contact =this.jList<Jobject>("contacts", constructor: () => Contact());
  }
}

class Contact with mixinJsonable {
  Contact({String name, String surname}) {
    print("SOno stato chiamato");
    this.name = this.jString("name", initialValue: name);
    this.surname = this.jString("surname", initialValue: surname);
  }

  Jstring name;
  Jstring surname;
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
  //p.fromJson(fakeJson);
  print(p.toMap());
}
