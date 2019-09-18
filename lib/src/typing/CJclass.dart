import 'package:jsonable/jsonable.dart';

class CJclass extends Jclass {
  JsonableConstructor _constructor;
  Jsonable get constructor => this._constructor();
  CJclass({Jsonable initialValue}) : super(initialValue: initialValue) {
    if (initialValue == null) {}
  }
}
