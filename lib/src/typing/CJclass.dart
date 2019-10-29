import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/errors.dart';
import 'package:jsonable/src/validator/rules.dart';

class CJclass<E extends Jsonable> extends JClass<E> {
  E Function() _constructor;
  Jsonable parent;
  E get newInstance => this._constructor();
  CJclass(
    Jsonable parent,
    keyname, {
    E initialValue,
    E Function() builder,
    List<Rule> rules: const [],
  }) : super(initialValue: initialValue, rules: rules) {
    if (initialValue == null) {
      if (builder == null) {
        throw noConstructorError;
      }
      this._constructor = builder;
    }
  }
}
