export "./src/jsonable.dart" show Jsonable;

typedef JsonableConstructor = JsonableObject Function();

abstract class JsonableObject {
  Map toMap();
  fromMap(Map map);
  // List<dynamic> fromJsonList(String listJson, JsonableConstructor contructor);
  // String toJson();
  // dynamic validate();
  //List<Jsonable> fromMapList(List<Map> map, JsonableConstructor constructor);
}

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

abstract class Jobject extends JsonType<JsonableObject> {
  Jobject({JsonableObject initialValue}) : super(value: initialValue);
}
