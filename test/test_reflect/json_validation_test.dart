import "package:jsonable/jsonable_reflect.dart";

import "package:test/test.dart";

class Person {
  @JsonValidator(min: 3, max: 10)
  String name = "Ni";
  String surname = "Spina";
  int years = 25;
}

main() {
  group("validation test", () {
    group(" function ", () {
      test("work validator?", () {
        var result = validate(Person());
        expect(result.error, true);
        expect(result.errors.length, 1);
      });
    });
  });
}
