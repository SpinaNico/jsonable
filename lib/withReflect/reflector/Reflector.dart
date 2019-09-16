export "./_Reflector.dart";

import 'dart:mirrors';

import 'package:jsonable/withReflect/validator/exceptions.dart';

abstract class ReflectValidator {
  List<JsonableException> validate(String name, dynamic value);
}

abstract class Reflect extends ReflectValidator {
  Type get type;
  Symbol get name;
  String get stringName => MirrorSystem.getName(this.name);
  bool get exclude;
}

abstract class ReflectGetter extends Reflect {
  dynamic get value;
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
  List<ReflectGetter> get getters;
}
