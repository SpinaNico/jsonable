import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/errors.dart';

class CJclass<E extends Jsonable> extends JClass<E> {
  E Function() _constructor;
  Jsonable parent;
  E get newInstance => this._constructor();
  CJclass({E initialValue, E Function() builder, this.parent})
      : super(initialValue: initialValue) {
    if (initialValue == null) {
      if (builder == null) {
        throw noConstructorError;
      }
      this.set(builder());
    }
  }
}
