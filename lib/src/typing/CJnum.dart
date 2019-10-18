import "package:jsonable/jsonable.dart";

class CJnum extends JNum {
  CJnum({num initialValue}) : super(initialValue: initialValue);

  int compareTo(num other) {
    return this.get.compareTo(other);
  }

  bool operator ==(Object other) {
    if (other is CJnum)
      return this.get == other.get;
    else
      return this.get == other;
  }

  bool operator >=(Object other) {
    if (other is CJnum)
      return this.get == other.get;
    else
      return this.get == other;
  }

  bool operator <=(Object other) {
    if (other is CJnum)
      return this.get == other.get;
    else
      return this.get == other;
  }
}
