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
  Map toMap() {
    return encodeJsonSchema(this._typer.schema);
  }

  fromMap(Map m) {
    return decodeJsonSchema(m, this._typer.schema);
  }

  /// It returns a Jclass in the generic of
  /// this type, extends Jsonable, moreover it requires
  /// the constructor a simple function that returns an
  /// instance of that type.
  ///
  /// **Note:** *it will be instantiated immediately to the
  /// declaration if InitialValue is null*
  Jclass<E> jClass<E extends Jsonable>(
      dynamic keyname, JsonableConstructor constructor,
      {E initialValue}) {
    CJclass v =
        CJclass<E>(initialValue: initialValue, constructor: constructor);
    var t = this._typer.registerType<Jclass>(keyname, v);
    return t;
  }

  /// Jlist represents a List that can contain any value, you can iterate
  /// over Jlist and you don't need to access the value via ".value",
  /// in this type the constructor parameter becomes mandatory
  /// if you are using a Jsonable as generic are not allowed types of data other
  /// **than: bool, string, num, int, double, map, list**
  Jlist<E> jList<E>(dynamic keyname,
      {List<E> initialValue, JsonableConstructor constructor}) {
    if (initialValue != null) {
      if (initialValue is List<Jsonable> && constructor == null) {
        throw noConstructorError;
      }
    }
    if (E is Jsonable && constructor == null) {
      throw noConstructorError;
    }

    Jlist<E> v =
        CJlist<E>(initialValue: initialValue, constructor: constructor);

    var t = this._typer.registerType<Jlist<E>>(keyname, v);
    return t;
  }

  /// DOCS
  Jstring jString(dynamic keyname, {String initialValue}) {
    Jstring value = new CJstring(initialValue: initialValue);
    var t = this._typer.registerType<Jstring>(keyname, value);
    return t;
  }

  Jbool jBool(dynamic keyname, {bool initialValue}) {
    Jbool v = CJbool(initialValue: initialValue);
    var t = this._typer.registerType<Jbool>(keyname, v);
    return t;
  }

  Jnum jNum(dynamic keyname, {num initialValue}) {
    Jnum v = CJnum(initialValue: initialValue);
    var t = this._typer.registerType<Jnum>(keyname, v);
    return t;
  }

  Jmap<E, R> jMap<E, R>(dynamic keyname, {Map<E, R> initialValue}) {
    Jmap<E, R> v = CJmap<E, R>(initialValue: initialValue);
    var t = this._typer.registerType<Jmap<E, R>>(keyname, v);
    return t;
  }

  Jdynamic jDynamic<E>(dynamic keyname, {dynamic initialValue}) {
    Jdynamic v = CJdynamic(initialValue: initialValue);
    var t = this._typer.registerType<Jdynamic>(keyname, v);
    return t;
  }
}
