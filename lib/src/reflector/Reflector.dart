export "./_Reflector.dart";

import 'dart:mirrors';

enum ReflectType {
  Method,
  Variable,
}

abstract class Reflect {
  Type get type;
  Symbol get name;
  String get stringName => MirrorSystem.getName(this.name);
}

abstract class ReflectGetter extends Reflect {
  dynamic invoke();
}

abstract class ReflectSetter extends Reflect {
  invoke(dynamic value);
}

abstract class ReflectVariable extends Reflect {
  dynamic get value;
}

abstract class ReflectInstance extends Reflect {
  List<ReflectVariable> get variables;
  InstanceMirror get instance;
  List<ReflectSetter> get setters;
  List<ReflectGetter> get methods;
}
