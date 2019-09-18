import "package:jsonable/withReflect/jsonable_reflect.dart";

class Person extends JsonableReflect {
  String name;
  String surname;
  String date;
}

main() {
  var p = Person();
  p.fromJson("""{"name": "Nico", "surname": "Spina"}""");
  print([p.name, p.surname, p.date]);
}
