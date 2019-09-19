import "package:jsonable/jsonable.dart";

class CJnum extends JNum {
  CJnum({num initialValue}) : super(initialValue: initialValue);

  int compareTo(num other) {
    return this.value.compareTo(other);
  }

  operator ==(Object other) {
    if (other is CJnum)
      return this.value == other.value;
    else
      return this.value == other;
  }

  operator >=(Object other) {
    if (other is CJnum)
      return this.value == other.value;
    else
      return this.value == other;
  }

  operator <=(Object other) {
    if (other is CJnum)
      return this.value == other.value;
    else
      return this.value == other;
  }
}
