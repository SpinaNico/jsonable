import 'package:jsonable/jsonable.dart';

class Person with Jsonable {
  late JDynamic name;
  late JDynamic surname;
  Person() {
    name = jDynamic("name");
    surname = jDynamic("surname");
  }
}
