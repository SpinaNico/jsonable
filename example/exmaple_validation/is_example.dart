import 'package:jsonable/jsonable.dart';

class Form with Jsonable {
  JString email;
  JString number;
  JString float;
  JString date;

  Form() {
    this.email = jString("email", rules: [
      Rules.isEmail(),
      Rules.min(5),
    ]);
    this.number = jString("number", rules: [
      Rules.isNumber(),
      Rules.isInt(),
    ]);
    this.float = jString("float", rules: [
      Rules.isDouble(),
      Rules.isNumber(),
    ]);
    this.date = jString("date", rules: [
      Rules.isDateTime(),
    ]);
  }
}
