import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/reflector/_mixinJsonNote.dart';
import 'package:jsonable/src/validator/_validator.dart';

import "./Reflector.dart";
import "dart:mirrors";

ReflectInstance reflection(object) {
  var o = reflect(object);
  return _ReflectInstance(o);
}

class _ReflectVariable
    with mixinJsonNote, mixinValidator
    implements ReflectVariable, ReflectValidator {
  Symbol _name;
  InstanceMirror _instanceMirror;

  _ReflectVariable(VariableMirror instance, InstanceMirror value) {
    this._name = instance.simpleName;
    this._instanceMirror = value;
    for (var val in value.type.metadata) {
      if (val.reflectee is JsonValidator) this.setValidator(val.reflectee);
      if (val.reflectee is JsonNote) this.setJsonNote(val.reflectee);
    }
  }
  Symbol get name => this._name;
  get value => this._instanceMirror.reflectee;
  Type get type => this._instanceMirror.reflectee.runtimeType;
  String get stringName =>
      this.keyName == null ? MirrorSystem.getName(this.name) : this.keyName;
}

class _ReflectGetter
    with mixinJsonNote, mixinValidator
    implements ReflectGetter, ReflectValidator {
  Symbol _name;
  Function _function;
  _ReflectGetter(Symbol name, Function value, {List<InstanceMirror> metadata}) {
    this._name = name;
    this._function = value;
    // annotation cyvle
    for (var val in metadata) {
      if (val.reflectee is JsonValidator) this.setValidator(val.reflectee);
      if (val.reflectee is JsonNote) this.setJsonNote(val.reflectee);
    }
  }
  Symbol get name => this._name;
  @override
  invoke() {
    return this._function();
  }

  Type get type => Function;
  String get stringName =>
      this.keyName == null ? MirrorSystem.getName(this.name) : this.keyName;
}

class _ReflectSetter implements ReflectSetter {
  Symbol _name;
  Function _function;
  _ReflectSetter(Symbol name, Function value) {
    this._name = name;
    this._function = value;
  }
  Symbol get name => this._name;
  @override
  invoke(dynamic value) {
    return this._function(value);
  }

  Type get type => Function;
  String get stringName => MirrorSystem.getName(this.name);
  bool get exclude => false;
}

class _ReflectInstance
    with mixinJsonNote, mixinValidator
    implements ReflectInstance, ReflectValidator {
  InstanceMirror _instance;
  Symbol _name;

  List<_ReflectGetter> _getter = [];
  List<_ReflectVariable> _variables = [];
  List<_ReflectSetter> _setters = [];
  _ReflectInstance(InstanceMirror instance, {Symbol name}) {
    this._instance = instance;
    this._name = name;

    // Add all annotation
    for (var meta in this._instance.type.metadata) {
      if (meta.reflectee is JsonValidator) this.setValidator(meta.reflectee);
      if (meta.reflectee is JsonNote) this.setJsonNote(meta.reflectee);
    }
    for (var v in this._instance.type.declarations.values) {
      if (v is VariableMirror) {
        this
            ._variables
            .add(_ReflectVariable(v, this._instance.getField(v.simpleName)));
      }
      if (v is MethodMirror) {
        if (v.isGetter) {
          this._getter.add(_ReflectGetter(
              v.simpleName, () => this._instance.invoke(v.simpleName, [], {}),
              metadata: v.metadata));
        } else if (v.isSetter) {
          this._setters.add(_ReflectSetter(v.simpleName,
              (value) => this._instance.invoke(v.simpleName, [value])));
        }
      }
    }
  }
  List<ReflectVariable> get variables => this._variables;

  List<ReflectGetter> get methods => this._getter;
  List<ReflectSetter> get setters => this._setters;

  Symbol get name => this._name;
  Type get type => this._instance.type.reflectedType;
  InstanceMirror get instance => this._instance;
  String get stringName =>
      this.keyName == null ? MirrorSystem.getName(this.name) : this.keyName;
}
