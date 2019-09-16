export "./src/jsonable.dart" show mixinJsonable;

typedef JsonableConstructor = Jsonable Function();

abstract class Jsonable {
  Jstring jString(String keyname, {validation, String initialValue});
  Jbool jBool(String keyname, {validation});
  Jnum jNum(String keyname, {validation});
  Jobject jObject(String keyname, JsonableConstructor constructor);
  fromJson(String json);
  List<dynamic> fromJsonList(String listJson, JsonableConstructor contructor);
  String toJson();
  dynamic validate();
  Map toMap();
  fromMap(Map map);
  List<Jsonable> fromMapList(List<Map> map, JsonableConstructor constructor);
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

abstract class Jstring extends JsonType<String> {
  Jstring({String initialValue}) : super(value: initialValue);
}

abstract class Jnum extends JsonType<num> {
  Jnum({num initialValue}) : super(value: initialValue);
}

abstract class Jbool extends JsonType<bool> {
  Jbool({bool initialValue}) : super(value: initialValue);
}

abstract class Jlist<E> extends JsonType<List<E>> {
  Jlist({List<E> initialValue}) : super(value: initialValue);
}

abstract class Jobject extends JsonType<Jsonable> {
  Jobject({Jsonable initialValue}) : super(value: initialValue);
}
