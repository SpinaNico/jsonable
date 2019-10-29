import 'package:jsonable/src/validator/rules.dart';
import "exceptions.dart";

class Validator {
  final List<Rule> rules;
  Validator(this.rules);

  List<JsonableException> validate() {
    return this
        .rules
        .map<JsonableException>((e) => e.exceptionBuilder(""))
        .toList();
  }
}
