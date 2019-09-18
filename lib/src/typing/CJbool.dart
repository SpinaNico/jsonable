import "package:jsonable/jsonable.dart";

class CJbool extends Jbool {
  CJbool({bool initialValue}) : super(initialValue: initialValue);
  operator ==(other) {
    if (other is CJbool)
      return this.value == other.value;
    else
      return this.value == other;
  }
}
