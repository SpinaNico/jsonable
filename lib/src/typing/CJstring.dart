import 'package:jsonable/jsonable.dart';

import 'package:jsonable/src/validator/rules.dart';

class CJstring extends JString {
  CJstring(Jsonable parent, keyname, {String initialValue, List<Rule> rules})
      : super(initialValue: initialValue, rules: rules);

  bool operator ==(Object other) {
    if (other is CJstring) return this.value == other.value;

    return this.value == other;
  }

  String operator +(Object o) {
    if (o is CJstring) {
      return value + o.value;
    }
    if (o is String) {
      return value + o;
    }
    return this.value + o;
  }

  @override
  int compareTo(String other) {
    return this.value.compareTo(other);
  }

  @override
  Iterable<Match> allMatches(String string, [int start = 0]) =>
      this.value.allMatches(string, start);

  Match matchAsPrefix(String string, [int start = 0]) =>
      this.value.matchAsPrefix(string, start);

  @override
  noSuchMethod(Invocation invocation) {
    return this.value.noSuchMethod(invocation);
  }
}
