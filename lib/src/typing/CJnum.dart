import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/validator/rules.dart';

class CJnum extends JNum {
  CJnum(Jsonable parent, keyname,
      {num initialValue, List<Rule> rules: const []})
      : super(initialValue: initialValue, rules: rules);

  int compareTo(num other) {
    return this.value.compareTo(other);
  }

  bool operator ==(Object other) {
    if (other is CJnum)
      return this.value == other.value;
    else
      return this.value == other;
  }

  bool operator >=(Object other) {
    if (other is CJnum)
      return this.value == other.value;
    else
      return this.value == other;
  }

  bool operator <=(Object other) {
    if (other is CJnum)
      return this.value == other.value;
    else
      return this.value == other;
  }
}
