import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/errors.dart';
import 'package:jsonable/src/validator/rules.dart';

class CJclass<E extends Jsonable> extends JClass<E> {
  late E Function() _constructor;
  E get newInstance => _constructor();
  CJclass(
    Jsonable parent,
    dynamic keyname, {
    E? initialValue,
    E Function()? builder,
    List<Rule>? rules = const [],
  }) : super(keyname, parent, initialValue: initialValue, rules: rules) {
    if (initialValue == null) {
      if (builder == null) {
        throw noConstructorError;
      }
      _constructor = builder;
    }
  }
}
