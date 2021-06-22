import 'package:jsonable/jsonable.dart';

var myPersonalRule = Rules.customRule((JType value) {
  if (value is JString) {
    if (value.getString() != "Nico") {
      return true;
    }
  }

  return false;
}, (JType value) => RuleException("${value.keyname} oh No!!"));

class Person with Jsonable {
  late JString name;

  Person() {
    name = jString("name", rules: [myPersonalRule]);
  }
}
