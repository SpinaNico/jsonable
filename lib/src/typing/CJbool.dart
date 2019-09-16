import "package:jsonable/jsonable.dart";

class CJbool extends Jbool {
  CJbool({bool initialValue}) : super(initialValue: initialValue);

  @override
  int compareTo(bool other) {
    if (this.value == other) return 0;
    return -1;
  }
}
