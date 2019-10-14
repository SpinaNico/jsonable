library jsonable;

export "./src/jsonable.dart" show Jsonable;
export './src/validator/validator.dart' show validator, Validator;
export './src/validator/exceptions.dart' show JsonableValidatorException;

import 'package:jsonable/src/jsonable.dart';
import 'package:jsonable/src/validator/validator.dart';

typedef JsonableConstructor = Jsonable Function();

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
  E get value => this._value;
  set value(E value) => this._value = value;

  ///Pass me a value to change the internal value to Jtype
  operator <<(E value) {
    this.value = value;
  }

  /// it returns the internal value of the JType if you pass
  /// another Jtype it will be replaced the value to the other.
  /// you can pass me null to simply receive the value inside
  E operator >>(JType<E> other) {
    if (other != null) {
      other << this.value;
    }
    return this.value;
  }
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
