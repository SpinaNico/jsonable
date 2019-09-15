import "package:jsonable/jsonable.dart";

class Person extends Jsonable {
  String name;
  @JsonNote(keyName: "SURNAME")
  String surname;
  @JsonNote(exclude: true)
  String date;
}

main() {
  var p = Person();
  p.fromJson("""{"name": "Nico", "surname": "Spina"}""");
  print([p.name, p.surname, p.date]);
  p.surname = "Spina!";
  print(p.toJson());
}
