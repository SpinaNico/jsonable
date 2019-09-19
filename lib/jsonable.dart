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

abstract class Jstring extends JType<String>
    implements Comparable<String>, Pattern {
  Jstring({String initialValue}) : super(value: initialValue);
}

abstract class Jnum extends JType<num> implements Comparable<num> {
  Jnum({num initialValue}) : super(value: initialValue);
}

abstract class Jbool extends JType<bool> {
  Jbool({bool initialValue}) : super(value: initialValue);
}

abstract class Jlist<E> extends JType<List<E>> implements List<E> {
  Jlist({List<E> initialValue}) : super(value: initialValue);
}

abstract class Jclass<E extends Jsonable> extends JType<E> {
  Jclass({Jsonable initialValue}) : super(value: initialValue);
}

abstract class Jmap<E, R> extends JType<Map> implements Map<E, R> {
  Jmap({Map initialValue}) : super(value: initialValue);
}

abstract class Jdynamic extends JType<dynamic> {
  Jdynamic({dynamic initialValue}) : super(value: initialValue);
}
