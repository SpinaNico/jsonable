library jsonable;

import 'package:jsonable/src/validator/exceptions.dart';
import 'package:jsonable/src/validator/rules.dart';
import "./src/mixin_jsonable.dart" show Jsonable;

export "./src/mixin_jsonable.dart" show Jsonable;
export "./src/validator/exceptions.dart";
export "./src/validator/rules.dart" show Rules;

typedef JsonableBuilder<E extends Jsonable> = E Function();

abstract class JType<E> {
  List<Rule>? _rules;
  JType(this.keyname, this.parent, {E? value, List<Rule>? rules = const []}) {
    if (value != null) {
      this.value = value;
    }
    _rules = rules;
  }

  /// this is JsonScheme object parent.
  Jsonable? parent;

  /// this is Keyname in jsonable object
  dynamic keyname;

  E? value;

  E? getValue() => value;
  void setValue(E value) => value = value;

  List<RuleException> validate() {
    return _rules!
        .where((r) => r.test(this)!)
        .map<RuleException>((e) => e.exceptionBuilder!(this))
        .toList();
  }
}

abstract class JString extends JType<String>
    implements Comparable<String>, Pattern {
  JString(dynamic keyname, Jsonable parent,
      {String? initialValue, List<Rule>? rules = const []})
      : super(keyname, parent, value: initialValue, rules: rules);

  String? getString() => value;
  void setString(String value) => value = value;

  bool operator ==(Object other);
  String operator +(Object other);
}

abstract class JNum extends JType<num> implements Comparable<num> {
  JNum(dynamic keyname, Jsonable parent, {num? initialValue, List<Rule>? rules})
      : super(keyname, parent, value: initialValue, rules: rules);

  num operator +(Object other);
  num operator -(Object other);
  num operator *(Object other);
  num operator /(Object other);
  int operator ~/(Object other);
  int operator %(Object other);
  bool operator ==(Object other);
  bool operator <=(Object other);
  bool operator >=(Object other);
  bool operator <(Object other);
  bool operator >(Object other);

  num? getNum() => value;
  void setNum(num value) => value = value;
}

abstract class JBool extends JType<bool> {
  JBool(dynamic keyname, Jsonable parent, {bool? initialValue, List<Rule>? rules})
      : super(keyname, parent, value: initialValue, rules: rules);
  bool? getBool() => value;
  void setBool(bool value) => value = value;
}

abstract class JList<E> extends JType<List<E>> implements List<E> {
  JList(dynamic keyname, Jsonable? parent,
      {List<E>? initialValue, List<Rule>? rules})
      : super(keyname, parent, value: initialValue, rules: rules);

  List<E>? getList() => value;
  void setList(List<E> value) => value = value;
  operator ==(Object other);
  List<E> operator +(Object other);
}

abstract class JClass<E extends Jsonable?> extends JType<E> {
  JClass(dynamic keyname, Jsonable parent,
      {Jsonable? initialValue, List<Rule>? rules})
      : super(keyname, parent, value: initialValue as E?, rules: rules);
  E? getClass() => value;
  void setClass(E value) => value = value;
}

abstract class JMap<E, R> extends JType<Map> implements Map<E, R> {
  JMap(dynamic keyname, Jsonable parent, {Map? initialValue, List<Rule>? rules})
      : super(keyname, parent, value: initialValue, rules: rules);

  Map<E?, R?>? getMap() => value as Map<E?, R?>?;
  void setMap(Map<E, R> value) => value = value;
}

abstract class JDynamic extends JType<dynamic> {
  JDynamic(dynamic keyname, Jsonable parent,
      {dynamic initialValue, List<Rule>? rules})
      : super(keyname, parent, value: initialValue, rules: rules);

  dynamic getDynamic() => value;
  void setDynamic(dynamic value) => value = value;
}
