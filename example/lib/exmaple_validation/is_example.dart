import 'package:jsonable/jsonable.dart';

class Form with Jsonable {
  late JString email;
  late JString number;
  late JString float;
  late JString date;

  Form() {
    email = jString("email", rules: [
      Rules.isEmail(),
      Rules.min(5),
    ]);
    number = jString("number", rules: [
      Rules.isNumber(),
      Rules.isInt(),
    ]);
    float = jString("float", rules: [
      Rules.isDouble(),
      Rules.isNumber(),
    ]);
    date = jString("date", rules: [
      Rules.isDateTime(),
    ]);
  }
}
