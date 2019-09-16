import "package:jsonable/jsonable.dart";

class CJstring extends Jstring {
  CJstring({String initialValue}) : super(initialValue: initialValue);

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
