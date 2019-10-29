library jsonable;

import 'package:jsonable/src/jsonable.dart';
import 'package:jsonable/src/validator/validator.dart';

export "./src/jsonable.dart" show Jsonable;
export './src/validator/validator.dart' show Validator;
export "./exceptions.dart";
export "./src/validator/rules.dart" show Rules;

typedef JsonableBuilder<E extends Jsonable> = E Function();

abstract class JType<E> {
  JType({E value}) {
    if (value != null) {
      this._value = value;
    }
  }
  E _value;
  Jsonable parent;
  dynamic keyname;
  E get get => this._value;
  void set(E value) => this._value = value;
}

abstract class JString extends JType<String>
    implements Comparable<String>, Pattern {
  JString({String initialValue})
      : super(
          value: initialValue,
        );
}

abstract class JNum extends JType<num> implements Comparable<num> {
  JNum({num initialValue, Validator validator})
      : super(
          value: initialValue,
        );
}

abstract class JBool extends JType<bool> {
  JBool({bool initialValue, Validator validator})
      : super(
          value: initialValue,
        );
}

abstract class JList<E> extends JType<List<E>> implements List<E> {
  JList({List<E> initialValue, Validator validator})
      : super(
          value: initialValue,
        );
}

abstract class JClass<E extends Jsonable> extends JType<E> {
  JClass({Jsonable initialValue, Validator validator})
      : super(
          value: initialValue,
        );
}

abstract class JMap<E, R> extends JType<Map> implements Map<E, R> {
  JMap({Map initialValue, Validator validator})
      : super(
          value: initialValue,
        );
}

abstract class JDynamic extends JType<dynamic> {
  JDynamic({dynamic initialValue, Validator validator})
      : super(
          value: initialValue,
        );
}
