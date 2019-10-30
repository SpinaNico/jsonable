import 'package:jsonable/jsonable.dart';

class Camp with Jsonable {
  JNum number;
  JString message;
  JList elements;
  JBool boolean;

  Camp() {
    elements = jList("elements", rules: [
      Rules.equal([1, 2, 3]),
      Rules.notEqual([4, 5, 6])
    ]);
    number = jNum("number", rules: [
      Rules.equal(5),
    ]);
    message = jString("message", rules: [
      Rules.equal("hello!"),
      Rules.len(6),
    ]);
    boolean = jBool("boolean", rules: [
      Rules.equal(true),
    ]);
  }
}
