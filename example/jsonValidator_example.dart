import "package:jsonable/withReflect/jsonable_reflect.dart";

class Person extends Jsonable {
  @JsonValidator(min: 3, max: 10, required: true)
  String name;
  @JsonValidator(min: 4, max: 20, required: true)
  String surname;
  @JsonValidator(required: true)
  String date;
}

main() {
  var p = Person();
  p.fromJson("""{"name": "Nico", "surname": "Spina"}""");
  var report = validate(p);
  print(report.toMap());
}
