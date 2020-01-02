import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/validator/rules.dart';

class CJnum extends JNum {
  CJnum(Jsonable parent, keyname,
      {num initialValue, List<Rule> rules = const []})
      : super(keyname, parent, initialValue: initialValue, rules: rules);

  @override
  int compareTo(num other) {
    return value.compareTo(other);
  }

  @override
  bool operator ==(Object other) {
    if (other is CJnum)
      return value == other.value;
    else
      return value == other;
  }

  @override
  bool operator >=(Object other) {
    if (other is CJnum)
      return value >= other.value;
    else
      return value >= other;
  }

  @override
  bool operator <=(Object other) {
    if (other is CJnum)
      return value <= other.value;
    else
      return value <= other;
  }

  @override
  int operator %(Object other) {
    if (other is JNum) return value % other.value;
    return value % other;
  }

  @override
  num operator *(Object other) {
    if (other is JNum) return value * other.value;
    return value * other;
  }

  @override
  num operator +(Object other) {
    if (other is JNum) return value + other.value;
    return value + other;
  }

  @override
  num operator -(Object other) {
    if (other is JNum) return value - other.value;
    return value - other;
  }

  @override
  num operator /(Object other) {
    if (other is JNum) return value / other.value;
    return value / other;
  }

  @override
  bool operator <(Object other) {
    if (other is JNum) return value < other.value;
    return value < other;
  }

  @override
  bool operator >(Object other) {
    if (other is JNum) return value > other.value;
    return value > other;
  }

  @override
  int operator ~/(Object other) {
    if (other is JNum) return value ~/ other.value;
    return value ~/ other;
  }
}
