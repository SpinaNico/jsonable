import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  JString name;
  JString surname;
  JClass<Permisions> permissions;
  JList tags;
  Person() {
    name = jString("name");
    surname = jString("surname");
    tags = jList<String>("tags");
    permissions = jClass<Permisions>("permisions", () => Permisions());
  }
}

class Permisions with Jsonable {
  JString role;
  JList<Permision> permisions;

  Permisions() {
    role = jString("role");
    permisions = jList<Permision>("permisions", builder: () => Permision());
  }
}

class Permision with Jsonable {
  JString type;
  JString description;
  Permision() {
    type = jString("type");
    description = jString("description");
  }
}
