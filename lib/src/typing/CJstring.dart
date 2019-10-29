import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/validator/rules.dart';

class CJstring extends JString {
  CJstring(Jsonable parent, keyname, {String initialValue, List<Rule> rules})
      : super(
          initialValue: initialValue,
        );

  operator ==(other) {
    if (other is CJstring)
      return this.get == other.get;
    else if (other is String)
      return this.get == other;
    else
      return this.get == other;
  }

  @override
  int compareTo(String other) {
    return this.get.compareTo(other);
  }

  @override
  Iterable<Match> allMatches(String string, [int start = 0]) =>
      this.get.allMatches(string, start);

  Match matchAsPrefix(String string, [int start = 0]) =>
      this.get.matchAsPrefix(string, start);

  @override
  noSuchMethod(Invocation invocation) {
    return this.get.noSuchMethod(invocation);
  }
}
