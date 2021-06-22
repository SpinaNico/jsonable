import 'package:jsonable/jsonable.dart';

class Person with Jsonable {
  late JString name;
  late JString surname;
  late JNum years;
  Person() {
    name = jString("name", rules: [
      Rules.max(12),
      Rules.min(4),
    ]);
    surname = jString("surname", rules: [
      Rules.min(4),
      Rules.max(12),
    ]);

    years = jNum("years", rules: [
      /// If this rule fails, you will get this error in the error list: GteRuleExcpetion
      /// To get the list of errors call .validate() (method of Jsoanble object)
      Rules.min(18, message: "My personal error message!"),
      Rules.max(99),
    ]);
  }
}
