import "package:jsonable/jsonable.dart";

class CJstring extends Jstring {
  CJstring({String initialValue}) : super(initialValue: initialValue);

  @override
  int compareTo(String other) {
    return this.value.compareTo(other);
  }

  @override
  Iterable<Match> allMatches(String string, [int start = 0]) {
    // TODO: implement allMatches
    return null;
  }

  @override
  Match matchAsPrefix(String string, [int start = 0]) {
    // TODO: implement matchAsPrefix
    return null;
  }
}
