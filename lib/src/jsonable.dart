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

  Jclass<E> jClass<E extends Jsonable>(
    dynamic keyname,
    E Function() constructor, {
    E initialValue,
  }) {
    CJclass v =
        CJclass<E>(initialValue: initialValue, constructor: constructor);
    var t = this._typer.registerType<Jclass>(keyname, v);
    return t;
  }

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

  Jmap jMap(dynamic keyname, {Map initialValue}) {
    Jmap v = CJmap(initialValue: initialValue);
    var t = this._typer.registerType<Jmap>(keyname, v);
    return t;
  }

  Jdynamic jDynamic(dynamic keyname, {dynamic initialValue}) {
    Jdynamic v = CJdynamic(initialValue: initialValue);
    var t = this._typer.registerType<Jdynamic>(keyname, v);
    return t;
  }
}
