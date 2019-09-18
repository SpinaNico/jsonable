export "./src/jsonable.dart" show Jsonable;
import 'package:jsonable/src/jsonable.dart';

typedef JsonableConstructor = Jsonable Function();

// abstract class JsonableObject {
//   Map toMap();
//   fromMap(Map map);
// }

abstract class JsonType<E> {
  JsonType({E value}) {
    if (value != null) {
      this._value = value;
    }
  }
  E _value;
  E get value => this._value;
  set value(E value) => this._value = value;
}

abstract class Jstring extends JsonType<String>
    implements Comparable<String>, Pattern {
  Jstring({String initialValue}) : super(value: initialValue);
}

abstract class Jnum extends JsonType<num> implements Comparable<num> {
  Jnum({num initialValue}) : super(value: initialValue);
}

abstract class Jbool extends JsonType<bool> {
  Jbool({bool initialValue}) : super(value: initialValue);
}

abstract class Jlist<E> extends JsonType<List<E>> implements List<E> {
  Jlist({List<E> initialValue}) : super(value: initialValue);
}

abstract class Jclass extends JsonType<Jsonable> {
  Jclass({Jsonable initialValue}) : super(value: initialValue);
}

abstract class Jmap extends JsonType<Map> {
  Jmap({Map initialValue}) : super(value: initialValue);
}

abstract class Jdynamic extends JsonType<dynamic> {
  Jdynamic({dynamic initialValue}) : super(value: initialValue);
}
