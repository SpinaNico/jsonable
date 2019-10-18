import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  JString name;
  JString surname;
  JClass<Permisions> permissions;
  JList tags;
  Person() {
    this.name = this.jString("name");
    this.surname = this.jString("surname");
    this.tags = this.jList<String>("tags");
    this.permissions =
        this.jClass<Permisions>("permisions", () => Permisions());
  }
}

class Permisions with Jsonable {
  JString role;
  JList<Permision> permisions;

  Permisions() {
    this.role = this.jString("role");
    this.permisions =
        this.jList<Permision>("permisions", builder: () => Permision());
  }
}

class Permision with Jsonable {
  JString type;
  JString description;
  Permision() {
    this.type = this.jString("type");
    this.description = this.jString("description");
  }
}
