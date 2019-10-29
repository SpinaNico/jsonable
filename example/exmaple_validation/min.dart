import 'package:jsonable/jsonable.dart';

class Person with Jsonable {
  JString name;
  JString surname;
  JNum years;
  Person() {
    name = this.jString("name");
    surname = this.jString("surname");

    years = this.jNum("years", rules: [
      /// If this rule fails, you will get this error in the error list: GteRuleExcpetion
      /// To get the list of errors call .validate() (method of Jsoanble object)
      Rules.gte(18, message: "My personal error message!"),
    ]);
  }
}
