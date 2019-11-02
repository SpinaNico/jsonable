import 'package:jsonable/jsonable.dart';

class SingUp with Jsonable {
  JString name;
  JString surname;
  JString denomination;
  JBool privacy;
  JBool cookie;

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
