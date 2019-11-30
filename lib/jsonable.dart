library jsonable;

import 'package:jsonable/src/validator/exceptions.dart';
import 'package:jsonable/src/validator/rules.dart';
import "./src/mixin_jsonable.dart" show Jsonable;

export "./src/mixin_jsonable.dart" show Jsonable;
export "./src/validator/exceptions.dart";
export "./src/validator/rules.dart" show Rules;

typedef JsonableBuilder<E extends Jsonable> = E Function();

abstract class JType<E> {
  List<Rule> _rules;
  JType({E value, List<Rule> rules: const []}) {
    if (value != null) {
      this._value = value;
    }
    this._rules = rules;
  }
  E _value;

  /// this is JsonScheme object parent.
  Jsonable parent;

  /// this is Keyname in jsonable object
  String keyname;

  E get value => this._value;
  void set value(E value) => this._value = value;

  E getValue() => this._value;
  void setValue(E value) => this._value = value;

  List<RuleException> validate() {
    return _rules
        .where((r) => r.test(this))
        .map<RuleException>((e) => e.exceptionBuilder(this))
        .toList();
  }
}

abstract class JString extends JType<String>
    implements Comparable<String>, Pattern {
  JString({String initialValue, List<Rule> rules: const []})
      : super(value: initialValue, rules: rules);

  String getString() => this._value;
  void setString(String value) => this._value = value;
}

abstract class JNum extends JType<num> implements Comparable<num> {
  JNum({num initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);

  num operator +(Object o);
  num operator -(Object o);
  num operator *(Object o);
  num operator /(Object o);
  int operator ~/(Object o);
  int operator %(Object o);
  bool operator ==(Object o);
  bool operator <=(Object o);
  bool operator >=(Object o);
  bool operator <(Object o);
  bool operator >(Object o);

  num getNum() => this._value;
  void setNum(num value) => this._value = value;
}

abstract class JBool extends JType<bool> {
  JBool({bool initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);
  bool getBool() => this._value;
  void setBool(bool value) => this._value = value;
}

abstract class JList<E> extends JType<List<E>> implements List<E> {
  JList({List<E> initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);

  List<E> getList() => this._value;
  void setList(List<E> value) => this._value = value;
}

abstract class JClass<E extends Jsonable> extends JType<E> {
  JClass({Jsonable initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);
  E getClass() => this._value;
  void setClass(E value) => this._value = value;
}

abstract class JMap<E, R> extends JType<Map> implements Map<E, R> {
  JMap({Map initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);

  Map<E, R> getMap() => this._value;
  void setMap(Map<E, R> value) => this._value = value;
}

abstract class JDynamic extends JType<dynamic> {
  JDynamic({dynamic initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);

  dynamic getDynamic() => this._value;
  void setDynamic(dynamic value) => this._value = value;
}
