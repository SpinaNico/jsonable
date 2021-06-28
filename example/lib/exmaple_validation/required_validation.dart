import 'package:jsonable/jsonable.dart';

class SingUp with Jsonable {
  late JString name;
  late JString surname;
  late JString denomination;
  late JBool privacy;
  late JBool cookie;

  SingUp() {
    name = jString("name", rules: [
      Rules.requiredWith(
        ["surname"],
      ),
    ]);
    surname = jString("surname", rules: [
      Rules.requiredWith(
        ["name"],
      ),
    ]);
    denomination = jString("denomination", rules: [
      Rules.requiredWithout(
        ["name", "surname"],
      ),
    ]);
    cookie = jBool(
      "cookie",
      rules: [Rules.required()],
    );
    privacy = jBool(
      "privacy",
      rules: [Rules.notEqual(false)],
    );
  }
}
