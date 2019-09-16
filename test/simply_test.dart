import 'package:jsonable/jsonable.dart';

class Person with mixinJsonable {
  Jstring name;

  Person() {
    this.name = this.jString("Name");
  }
}

main() {
  var p = Person();
  p.toMap();
  p.name.value = "Mario";
  p.toMap();
}
