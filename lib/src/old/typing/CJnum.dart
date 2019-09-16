import "package:jsonable/jsonable.dart";

class CJnum extends Jnum {
  CJnum({num initialValue}) : super(initialValue: initialValue);

  @override
  int compareTo(num other) {
    return this.value.compareTo(other);
  }
}
