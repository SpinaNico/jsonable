import "package:jsonable/jsonable.dart";

class CJbool extends JBool {
  CJbool(Jsonable parent, keyname, {bool initialValue})
      : super(initialValue: initialValue);
  operator ==(other) {
    if (other is CJbool)
      return this.get == other.get;
    else
      return this.get == other;
  }
}
