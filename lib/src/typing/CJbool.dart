import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/validator/rules.dart';

class CJbool extends JBool {
  CJbool(Jsonable parent, keyname,
      {bool initialValue, List<Rule> rules: const []})
      : super(initialValue: initialValue, rules: rules);
  operator ==(other) {
    if (other is CJbool)
      return this.value == other.value;
    else
      return this.value == other;
  }
}
