import "package:jsonable/jsonable_reflect.dart";

class Person extends Mapable {
  String name;
  String surname;
  String date;
}

main() {
  Map<String, dynamic> m = {"name": "Nico", "surname": "Spina"};
  var p = Person();
  p.fromMap(m);
  print([p.name, p.surname, p.date]);
}
