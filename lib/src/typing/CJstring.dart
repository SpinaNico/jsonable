import 'package:jsonable/jsonable.dart';

import 'package:jsonable/src/validator/rules.dart';

class CJstring extends JString {
  CJstring(Jsonable parent, dynamic keyname,
      {String? initialValue, List<Rule>? rules})
      : super(keyname, parent, initialValue: initialValue, rules: rules);

  bool operator ==(Object other) {
    if (other is CJstring) return value == other.value;

    return value == other;
  }

  String operator +(Object other) {
    if (other is CJstring) {
      return value! + other.value!;
    }
    if (other is String) {
      return value! + other;
    }
    return value! + (other as String);
  }

  @override
  int compareTo(String other) {
    return value!.compareTo(other);
  }

  @override
  Iterable<Match> allMatches(String string, [int start = 0]) =>
      value!.allMatches(string, start);

  Match? matchAsPrefix(String string, [int start = 0]) =>
      value!.matchAsPrefix(string, start);

  @override
  noSuchMethod(Invocation invocation) {
    return value.noSuchMethod(invocation);
  }
}
