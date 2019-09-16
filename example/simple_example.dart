import "package:jsonable/jsonable_reflect.dart";

class Person {
  String name = "Nico";
  String surname = "Spina";
}

main() {
  var result = jsonable(Person());
  print(result);
}
