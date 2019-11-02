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
  JString name;

  Person() {
    this.name = this.jString("name", rules: [myPersonalRule]);
  }
}
