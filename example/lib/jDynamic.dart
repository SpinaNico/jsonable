import 'package:jsonable/jsonable.dart';

class Person with Jsonable {
  JDynamic name;
  JDynamic surname;
  Person() {
    name = jDynamic("name");
    surname = jDynamic("surname");
  }
}
