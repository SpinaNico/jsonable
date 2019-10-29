import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/validator/rules.dart';

class CJbool extends JBool {
  CJbool(Jsonable parent, keyname,
      {bool initialValue, List<Rule> rules: const []})
      : super(initialValue: initialValue);
  operator ==(other) {
    if (other is CJbool)
      return this.get == other.get;
    else
      return this.get == other;
  }
}
