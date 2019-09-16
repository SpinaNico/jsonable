import "package:jsonable/jsonable.dart";

class CJnum extends Jnum {
  CJnum({num initialValue}) : super(initialValue: initialValue);

  int compareTo(num other) {
    return this.value.compareTo(other);
  }

  operator ==(Object other) {
    return this.value == other;
  }

  operator >=(Object other) {
    return this.value >= other;
  }

  operator <=(Object other) {
    return this.value <= other;
  }
}
