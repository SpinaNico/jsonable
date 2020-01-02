import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/validator/rules.dart';

class CJbool extends JBool {
  CJbool(Jsonable parent, keyname,
      {bool initialValue, List<Rule> rules = const []})
      : super(keyname, parent, initialValue: initialValue, rules: rules);
  operator ==(other) {
    if (other is CJbool)
      return value == other.value;
    else
      return value == other;
  }
}
