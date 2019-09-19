import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/errors.dart';

class CJclass<E extends Jsonable> extends JClass<E> {
  E Function() _constructor;
  E get newInstance => this._constructor();
  CJclass({E initialValue, E Function() constructor})
      : super(initialValue: initialValue) {
    if (initialValue == null) {
      if (constructor == null) {
        throw noConstructorError;
      }
      this.value = constructor();
    }
  }
}
