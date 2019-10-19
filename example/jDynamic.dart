import 'package:jsonable/jsonable.dart';

class Person with Jsonable {
  JDynamic name;
  JDynamic surname;
  Person() {
    this.name = jDynamic("name");
    this.surname = jDynamic("surname");
  }
}
