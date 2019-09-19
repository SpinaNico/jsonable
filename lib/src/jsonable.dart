import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/errors.dart';
import 'package:jsonable/src/scheme/JsonSchema.dart';
import 'package:jsonable/src/scheme/fx.dart';
import 'package:jsonable/src/typing/CJbool.dart';
import 'package:jsonable/src/typing/CJdynamic.dart';
import 'package:jsonable/src/typing/CJlist.dart';
import 'package:jsonable/src/typing/CJmap.dart';
import 'package:jsonable/src/typing/CJnum.dart';
import 'package:jsonable/src/typing/CJclass.dart';
import "./typing/_Typezer.dart";
import "./typing/CJstring.dart";
import "dart:convert";

mixin Jsonable {
  Typer _typer = Typer();
  set value(value) => throw "you cannot set a scheme already created";

  /// Get Scheme
  JsonSchema get value => this._typer.schema;

  String toJson() => jsonEncode(this.toMap());
  fromJson(String source) => this.fromMap(jsonDecode(source));

  Map toMap() => encodeJsonSchema(this._typer.schema);
  fromMap(Map m) => decodeJsonSchema(m, this._typer.schema);

  /// It returns a `JClass` in the generic of
  /// this type, extends Jsonable, moreover it requires
  /// the constructor a simple function that returns an
  /// instance of that type.
  ///
  /// **Note:** *it will be instantiated immediately to the
  /// declaration if InitialValue is null*
  JClass<E> jClass<E extends Jsonable>(keyname, JsonableConstructor constructor,
      {E initialValue}) {
    CJclass v =
        CJclass<E>(initialValue: initialValue, constructor: constructor);
    var t = this._typer.registerType<JClass>(keyname, v);
    return t;
  }

  ///`JList` represents a List that can contain any value, you can iterate
  /// over JList and you don't need to access the value via ".value",
  /// in this type the constructor parameter becomes mandatory
  /// if you are using a Jsonable as generic are not allowed types of data other
  /// **than: bool, string, num, int, double, map, list**
  JList<E> jList<E>(keyname,
      {List<E> initialValue, JsonableConstructor constructor}) {
    if (initialValue != null) {
      if (initialValue is List<Jsonable> && constructor == null) {
        throw noConstructorError;
      }
    }
    if (E is Jsonable && constructor == null) {
      throw noConstructorError;
    }

    JList<E> v =
        CJlist<E>(initialValue: initialValue, constructor: constructor);

    var t = this._typer.registerType<JList<E>>(keyname, v);
    return t;
  }

  /// Return a `JType <String>` then manage a `String` type in the schema
  /// with `fromJson` will assign the value only if it is a `String`,
  /// in `toJson` it will assign a `String`, you can assign only `String` ù
  /// values via ".value"
  JString jString(keyname, {String initialValue}) {
    JString value = new CJstring(initialValue: initialValue);
    var t = this._typer.registerType<JString>(keyname, value);
    return t;
  }

  /// Return a `JType <bool>` then manage a `bool` type in the schema with
  /// `fromJson` will assign the value only if it is a `bool`, in
  /// `toJson` it will assign a `bool`, you can assign only `bool` values via ".value"
  JBool jBool(keyname, {bool initialValue}) {
    JBool v = CJbool(initialValue: initialValue);
    var t = this._typer.registerType<JBool>(keyname, v);
    return t;
  }

  ///Return a `JType <num>` then manage a `num` type in
  /// the schema with `fromJson` will assign the value
  /// only if it is a `num`, in `toJson` it will assign a
  ///  `num`, you can assign only `num` values via ".value"
  JNum jNum(keyname, {num initialValue}) {
    JNum v = CJnum(initialValue: initialValue);
    var t = this._typer.registerType<JNum>(keyname, v);
    return t;
  }

  ///Return a `JType <Map<E,R>>` then manage a `Map<E,R>` type in the schema with
  ///`fromJson` will assign the value  only if it is a `Map<E,R>`, in `toJson`
  ///it will assign a `Map<E,R>`, you can assign only `Map<E,R>` values via ".value"
  JMap<E, R> jMap<E, R>(keyname, {Map<E, R> initialValue}) {
    JMap<E, R> v = CJmap<E, R>(initialValue: initialValue);
    var t = this._typer.registerType<JMap<E, R>>(keyname, v);
    return t;
  }

  JDynamic jDynamic<E>(keyname, {dynamic initialValue}) {
    JDynamic v = CJdynamic(initialValue: initialValue);
    var t = this._typer.registerType<JDynamic>(keyname, v);
    return t;
  }

  //JType<E> jType<E>(keyname) {}
}
