import "package:jsonable/jsonable.dart";

import 'package:jsonable/src/validator/rules.dart';

class CJstring extends JString {
  CJstring(Jsonable parent, keyname, {String initialValue, List<Rule> rules})
      : super(initialValue: initialValue, rules: rules);

  operator ==(other) {
    if (other is CJstring)
      return this.value == other.value;
    else if (other is String)
      return this.value == other;
    else
      return this.value == other;
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
