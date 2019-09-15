import "./Reflector.dart";
import "dart:mirrors";

ReflectInstance reflection(object) {
  var o = reflect(object);
  return _ReflectInstance(o);
}

class _ReflectVariable implements ReflectVariable {
  Symbol _name;
  InstanceMirror _instanceMirror;
  _ReflectVariable(VariableMirror instance, InstanceMirror value) {
    this._name = instance.simpleName;
    this._instanceMirror = value;
  }
  Symbol get name => this._name;
  get value => this._instanceMirror.reflectee;
  Type get type => this._instanceMirror.reflectee.runtimeType;
  String get stringName => MirrorSystem.getName(this.name);
}

class _ReflectGetter implements ReflectGetter {
  Symbol _name;
  Function _function;
  _ReflectGetter(Symbol name, Function value) {
    this._name = name;
    this._function = value;
  }
  Symbol get name => this._name;
  @override
  invoke() {
    return this._function();
  }

  Type get type => Function;
  String get stringName => MirrorSystem.getName(this.name);
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
}

class _ReflectInstance implements ReflectInstance {
  InstanceMirror _instance;
  Symbol _name;
  List<_ReflectGetter> _getter = [];
  List<_ReflectVariable> _variables = [];
  List<_ReflectSetter> _setters = [];
  _ReflectInstance(InstanceMirror instance, {Symbol name}) {
    this._instance = instance;
    this._name = name;
    for (var v in this._instance.type.declarations.values) {
      if (v is VariableMirror) {
        this
            ._variables
            .add(_ReflectVariable(v, this._instance.getField(v.simpleName)));
      }

      if (v is MethodMirror) {
        if (v.isGetter) {
          this._getter.add(_ReflectGetter(
              v.simpleName, () => this._instance.invoke(v.simpleName, [], {})));
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

  String get stringName => MirrorSystem.getName(this.name);
}
