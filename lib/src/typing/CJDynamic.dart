import "package:jsonable/jsonable.dart";

class CJdynamic<E> extends Jdynamic {
  dynamic _value;
  E get value => this._value;
  set value(v) => this._value = v;
}
