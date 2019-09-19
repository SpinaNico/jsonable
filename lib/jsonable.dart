export "./src/jsonable.dart" show Jsonable;
import 'package:jsonable/src/jsonable.dart';

typedef JsonableConstructor = Jsonable Function();

abstract class JType<E> {
  JType({E value}) {
    if (value != null) {
      this._value = value;
    }
  }
  E _value;
  E get value => this._value;
  set value(E value) => this._value = value;
}

abstract class JString extends JType<String>
    implements Comparable<String>, Pattern {
  JString({String initialValue}) : super(value: initialValue);
}

abstract class JNum extends JType<num> implements Comparable<num> {
  JNum({num initialValue}) : super(value: initialValue);
}

abstract class JBool extends JType<bool> {
  JBool({bool initialValue}) : super(value: initialValue);
}

abstract class JList<E> extends JType<List<E>> implements List<E> {
  JList({List<E> initialValue}) : super(value: initialValue);
}

abstract class JClass<E extends Jsonable> extends JType<E> {
  JClass({Jsonable initialValue}) : super(value: initialValue);
}

abstract class JMap<E, R> extends JType<Map> implements Map<E, R> {
  JMap({Map initialValue}) : super(value: initialValue);
}

abstract class JDynamic extends JType<dynamic> {
  JDynamic({dynamic initialValue}) : super(value: initialValue);
}
