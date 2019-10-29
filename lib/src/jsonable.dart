import "dart:convert";

import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/errors.dart';
import 'package:jsonable/src/scheme/JsonSchema.dart';
import 'package:jsonable/src/scheme/fx.dart';
import 'package:jsonable/src/typing/CJbool.dart';
import 'package:jsonable/src/typing/CJclass.dart';
import 'package:jsonable/src/typing/CJdynamic.dart';
import 'package:jsonable/src/typing/CJlist.dart';
import 'package:jsonable/src/typing/CJmap.dart';
import 'package:jsonable/src/typing/CJnum.dart';
import 'package:jsonable/src/validator/rules.dart';
import 'package:jsonable/src/validator/validator.dart';

import "./typing/CJstring.dart";
import "./typing/_Typezer.dart";

mixin Jsonable {
  Typer _typer = Typer();
  JsonSchema get scheme => this._typer.schema;

  Map<String, List<RuleException>> validate() {
    return this.scheme.map<String, List<RuleException>>((s, t) {
      return MapEntry(s, validateField(t));
    });
  }

  String toJson() => jsonEncode(this.toMap());
  fromJson(String source) => this.fromMap(jsonDecode(source));

  Map toMap() => encodeJsonSchema(this._typer.schema);
  fromMap(Map m) => decodeJsonSchema(m, this._typer.schema);

  /// returns the JType within the schema
  JType operator [](String keyName) => this._typer.schema[keyName];

  /// It returns a `JClass` in the generic of
  /// this type, extends Jsonable, moreover it requires
  /// the constructor a simple function that returns an
  /// instance of that type.
  ///
  /// **Note:** *it will be instantiated immediately to the
  /// declaration if InitialValue is null*
  JClass<E> jClass<E extends Jsonable>(
    String keyName,
    JsonableBuilder constructor, {
    E initialValue,
    List<Rule> rules,
  }) {
    CJclass v = CJclass<E>(this, keyName,
        initialValue: initialValue, builder: constructor, rules: rules);
    var t = this._typer.registerType<JClass>(keyName, v);
    return t;
  }

  ///`JList` represents a List that can contain any value, you can iterate
  /// over JList and you don't need to access the value via ".value",
  /// in this type the constructor parameter becomes mandatory
  /// if you are using a Jsonable as generic are not allowed types of data other
  /// **than: bool, string, num, int, double, map, list**
  JList<E> jList<E>(String keyName,
      {List<E> initialValue, JsonableBuilder builder, List<Rule> rules}) {
    if (initialValue != null) {
      if (initialValue is List<Jsonable> && builder == null) {
        throw noConstructorError;
      }
    }
    if (E is Jsonable && builder == null) {
      throw noConstructorError;
    }

    JList<E> v = CJlist<E>(this, keyName,
        initialValue: initialValue, builder: builder, rules: rules);

    var t = this._typer.registerType<JList<E>>(keyName, v);
    return t;
  }

  /// Return a `JType <String>` then manage a `String` type in the schema
  /// with `fromJson` will assign the value only if it is a `String`,
  /// in `toJson` it will assign a `String`, you can assign only `String` ù
  /// values via ".value"
  JString jString(String keyName, {String initialValue, List<Rule> rules}) {
    JString value =
        new CJstring(this, keyName, initialValue: initialValue, rules: rules);
    var t = this._typer.registerType<JString>(keyName, value);
    return t;
  }

  /// Return a `JType <bool>` then manage a `bool` type in the schema with
  /// `fromJson` will assign the value only if it is a `bool`, in
  /// `toJson` it will assign a `bool`, you can assign only `bool` values via ".value"
  JBool jBool(String keyName, {bool initialValue, List<Rule> rules}) {
    JBool v = CJbool(this, keyName, initialValue: initialValue, rules: rules);
    var t = this._typer.registerType<JBool>(keyName, v);
    return t;
  }

  ///Return a `JType <num>` then manage a `num` type in
  /// the schema with `fromJson` will assign the value
  /// only if it is a `num`, in `toJson` it will assign a
  ///  `num`, you can assign only `num` values via ".value"
  JNum jNum(String keyName, {num initialValue, List<Rule> rules}) {
    JNum v = CJnum(this, keyName, initialValue: initialValue, rules: rules);
    var t = this._typer.registerType<JNum>(keyName, v);
    return t;
  }

  ///Return a `JType <Map<E,R>>` then manage a `Map<E,R>` type in the schema with
  ///`fromJson` will assign the value  only if it is a `Map<E,R>`, in `toJson`
  ///it will assign a `Map<E,R>`, you can assign only `Map<E,R>` values via ".value"
  JMap<E, R> jMap<E, R>(String keyName,
      {Map<E, R> initialValue, JsonableBuilder builder, List<Rule> rules}) {
    if (R is Jsonable && builder == null) {
      throw noConstructorError;
    }

    JMap<E, R> v = CJmap<E, R>(this, keyName,
        initialValue: initialValue, builder: builder, rules: rules);

    var t = this._typer.registerType<JMap<E, R>>(keyName, v);
    return t;
  }

  JDynamic jDynamic<E>(String keyName,
      {dynamic initialValue, List<Rule> rules}) {
    JDynamic v =
        CJdynamic(this, keyName, initialValue: initialValue, rules: rules);
    var t = this._typer.registerType<JDynamic>(keyName, v);
    return t;
  }

  //JType<E> jType<E>(String keyName) {}
  /// **EXPERIMENTAL**
  /// jOnce Returns the same value that passes in the value, the value you pass:
  /// it is inserted inside the Json schema, in a JClass that is not instantiated, further.
  /// This function is very useful when you are in a context like Flutter,
  /// where objects are called only in the widget build.
  /// Jonce returns your widget, without compromising it as long as the widget uses Jsonable
  dynamic jOnce(String keyName, Jsonable value) {
    if (value is Jsonable) {
      this
          ._typer
          .registerType(keyName, CJclass(this, keyName, initialValue: value));
    }
    return value;
  }
}
