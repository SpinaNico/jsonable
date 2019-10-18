library jsonable;

import 'package:jsonable/src/jsonable.dart';
import 'package:jsonable/src/validator/validator.dart';

export "./src/jsonable.dart" show Jsonable;
export './src/validator/exceptions.dart' show JsonableValidatorException;
export './src/validator/validator.dart' show validator, Validator;

typedef JsonableBuilder<E extends Jsonable> = E Function();

abstract class JType<E> {
  CValidator _validator;
  Validator get validator => this._validator;
  JType({E value, Validator validator}) {
    this._validator = validator;
    if (value != null) {
      this._value = value;
    }
  }
  E _value;
  E get get => this._value;
  void set(E value) => this._value = value;
}

abstract class JString extends JType<String>
    implements Comparable<String>, Pattern {
  JString({String initialValue, Validator validator})
      : super(
          value: initialValue,
          validator: validator,
        );
}

abstract class JNum extends JType<num> implements Comparable<num> {
  JNum({num initialValue, Validator validator})
      : super(
          value: initialValue,
          validator: validator,
        );
}

abstract class JBool extends JType<bool> {
  JBool({bool initialValue, Validator validator})
      : super(value: initialValue, validator: validator);
}

abstract class JList<E> extends JType<List<E>> implements List<E> {
  JList({List<E> initialValue, Validator validator})
      : super(value: initialValue, validator: validator);
}

abstract class JClass<E extends Jsonable> extends JType<E> {
  JClass({Jsonable initialValue, Validator validator})
      : super(value: initialValue, validator: validator);
}

abstract class JMap<E, R> extends JType<Map> implements Map<E, R> {
  JMap({Map initialValue, Validator validator})
      : super(value: initialValue, validator: validator);
}

abstract class JDynamic extends JType<dynamic> {
  JDynamic({dynamic initialValue, Validator validator})
      : super(value: initialValue, validator: validator);
}
