import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  late JString name;
  late JString surname;
  late JClass<Permisions> permissions;
  late JList<String?> tags;
  Person() {
    name = jString("name");
    surname = jString("surname");
    tags = jList<String>("tags");
    permissions = jClass<Permisions>("permisions", () => Permisions());
  }
}

class Permisions with Jsonable {
  late JString role;
  late JList<Permision?> permisions;

  Permisions() {
    role = jString("role");
    permisions = jList<Permision>("permisions", builder: () => Permision());
  }
}

class Permision with Jsonable {
  late JString type;
  late JString description;
  Permision() {
    type = jString("type");
    description = jString("description");
  }
}
