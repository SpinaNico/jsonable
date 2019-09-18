import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/scheme/fx.dart';
import "./typing/_Typezer.dart";
import "./typing/CJstring.dart";

mixin Jsonable implements JsonableObject {
  Typer _typer = Typer();

  Map toMap() {
    print(this._typer.schema.length);
    return encodeJsonSchema(this._typer.schema);
  }

  fromMap(Map m) {}

  JsonableObject jObject(dynamic keyname, JsonableConstructor construct,
      {List positionalParam, Map nominalParam}) {}

  List<E> jList<E>(dynamic kyname, {List<E> initialValue}) {
    if (initialValue != null) {
      return initialValue;
    }
    return List<E>();
  }

  /// DOCS
  Jstring jString(dynamic keyname, {String initialValue}) {
    Jstring value = CJstring(initialValue: initialValue);
    var t = this._typer.registerType(keyname, value);
    return t;
  }

  bool jBool(dynamic keyname, {bool initialValue}) {
    if (initialValue != null) {
      return initialValue;
    }

    return false;
  }

  num jNum(dynamic keyname, {num initialValue}) {
    if (initialValue != null) {
      return initialValue;
    }

    return 0;
  }
}
