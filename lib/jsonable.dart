library jsonable;

import 'package:jsonable/src/jsonable.dart';
import 'package:jsonable/src/validator/exceptions.dart';
import 'package:jsonable/src/validator/rules.dart';
export "./src/jsonable.dart" show Jsonable;
export "./exceptions.dart";
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
  Jsonable parent;
  String keyname;
  E get get => this._value;
  void set set(E value) => this._value = value;
  List<RuleException> validate() {
    return _rules
        .where((r) => !r.test(this))
        .map<RuleException>((e) => e.exceptionBuilder(this))
        .toList();
  }
}

abstract class JString extends JType<String>
    implements Comparable<String>, Pattern {
  JString({String initialValue, List<Rule> rules: const []})
      : super(value: initialValue);
}

abstract class JNum extends JType<num> implements Comparable<num> {
  JNum({num initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);
}

abstract class JBool extends JType<bool> {
  JBool({bool initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);
}

abstract class JList<E> extends JType<List<E>> implements List<E> {
  JList({List<E> initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);
}

abstract class JClass<E extends Jsonable> extends JType<E> {
  JClass({Jsonable initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);
}

abstract class JMap<E, R> extends JType<Map> implements Map<E, R> {
  JMap({Map initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);
}

abstract class JDynamic extends JType<dynamic> {
  JDynamic({dynamic initialValue, List<Rule> rules})
      : super(value: initialValue, rules: rules);
}
