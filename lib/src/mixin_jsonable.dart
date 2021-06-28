import 'dart:convert';

import 'package:jsonable/jsonable.dart';
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

import './typing/CJstring.dart';
import './typing/_Typezer.dart';

mixin Jsonable {
  final Typer _typer = Typer();
  JsonSchema get scheme => _typer.schema;

  /// A structural validation returns for each field
  Map<String, List<RuleException>?> validate() {
    return scheme.map<String, List<RuleException>?>((s, t) {
      return MapEntry(s, t.validate());
    });
  }

  String toJson() => jsonEncode(toMap());
  fromJson(String source) => fromMap(jsonDecode(source));

  Map toMap() => encodeJsonSchema(_typer.schema);
  fromMap(Map? m) => decodeJsonSchema(m, _typer.schema);

  /// this method call .fromMap method.
  update(Map m) => fromMap(m);

  /// returns the JType within the schema
  JType? operator [](String keyName) => _typer.schema[keyName];

  E registerType<E extends JType>(keyName, E v) {
    v.keyname = keyName;
    v.parent = this;
    return _typer.registerType<E>(keyName, v);
  }

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
    E? initialValue,
    List<Rule>? rules,
  }) {
    CJclass v = CJclass<E>(this, keyName,
        initialValue: initialValue, builder: constructor as E Function()?, rules: rules);
    var t = registerType<JClass>(keyName, v);
    return t as JClass<E>;
  }

  ///`JList` represents a List that can contain any value, you can iterate
  /// over JList and you don't need to access the value via ".value",
  /// in this type the constructor parameter becomes mandatory
  /// if you are using a Jsonable as generic are not allowed types of data other
  /// **than: bool, string, num, int, double, map, list**
  JList<E?> jList<E>(String keyName,
      {List<E>? initialValue, JsonableBuilder? builder, List<Rule>? rules}) {
    if (initialValue != null) {
      if (initialValue is List<Jsonable> && builder == null) {
        throw noConstructorError;
      }
    }
    if (E is Jsonable && builder == null) {
      throw noConstructorError;
    }

    JList<E?> v = CJlist<E>(this, keyName,
        initialValue: initialValue, builder: builder, rules: rules);

    var t = registerType<JList<E?>>(keyName, v);
    return t;
  }

  /// Return a `JType <String>` then manage a `String` type in the schema
  /// with `fromJson` will assign the value only if it is a `String`,
  /// in `toJson` it will assign a `String`, you can assign only `String` ù
  /// values via ".value"
  JString jString(String keyName, {String? initialValue, List<Rule>? rules}) {
    JString value =
        CJstring(this, keyName, initialValue: initialValue, rules: rules);
    var t = registerType<JString>(keyName, value);
    return t;
  }

  /// Return a `JType <bool>` then manage a `bool` type in the schema with
  /// `fromJson` will assign the value only if it is a `bool`, in
  /// `toJson` it will assign a `bool`, you can assign only `bool` values via ".value"
  JBool jBool(String keyName, {bool? initialValue, List<Rule>? rules}) {
    JBool v = CJbool(this, keyName, initialValue: initialValue, rules: rules);
    var t = registerType<JBool>(keyName, v);
    return t;
  }

  ///Return a `JType <num>` then manage a `num` type in
  /// the schema with `fromJson` will assign the value
  /// only if it is a `num`, in `toJson` it will assign a
  ///  `num`, you can assign only `num` values via ".value"
  JNum jNum(String keyName, {num? initialValue, List<Rule>? rules}) {
    JNum v = CJnum(this, keyName, initialValue: initialValue, rules: rules);
    var t = registerType<JNum>(keyName, v);
    return t;
  }

  ///Return a `JType <Map<E,R>>` then manage a `Map<E,R>` type in the schema with
  ///`fromJson` will assign the value  only if it is a `Map<E,R>`, in `toJson`
  ///it will assign a `Map<E,R>`, you can assign only `Map<E,R>` values via ".value"
  JMap<E?, R?> jMap<E, R>(String keyName,
      {Map<E, R>? initialValue, JsonableBuilder? builder, List<Rule>? rules}) {
    if (R is Jsonable && builder == null) {
      throw noConstructorError;
    }

    JMap<E?, R?> v = CJmap<E, R>(this, keyName,
        initialValue: initialValue, builder: builder, rules: rules);

    var t = registerType<JMap<E?, R?>>(keyName, v);
    return t;
  }

  JDynamic jDynamic<E>(String keyName,
      {dynamic initialValue, List<Rule>? rules}) {
    JDynamic v =
        CJdynamic(this, keyName, initialValue: initialValue, rules: rules);
    var t = registerType<JDynamic>(keyName, v);
    return t;
  }
}
