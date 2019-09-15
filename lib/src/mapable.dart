import "dart:mirrors";
import "../jsonable.dart";

mixin mixinMap {
  fromMap(Map<String, dynamic> values) {
    rawfromMap(this, values);
  }

  Map<String, dynamic> toMap() {
    return mapable(this);
  }
}

///This function receives an object and returns the Map of its fields
Map<String, dynamic> mapable(Object o) {
  Map<String, dynamic> result = {};
  var t = reflect(o);
  for (var v in t.type.declarations.values) {
    var name = MirrorSystem.getName(v.simpleName);
    if (v is VariableMirror && v.isPrivate == false) {
      var value = t.getField(v.simpleName).reflectee;
      if (value is Mapable) {
        result.addAll({"$name": value.toMap()});
      } else {
        result.addAll({"$name": value});
      }
    }
  }
  return result;
}

rawfromMap(Object o, Map<String, dynamic> m) {
  var t = reflect(o);
  for (var v in t.type.declarations.values) {
    var name = MirrorSystem.getName(v.simpleName);
    if (v is VariableMirror && v.isPrivate == false) {
      var value = t.getField(v.simpleName).reflectee;
      if (value is Mapable) {
        value.fromMap(m[name]);
      } else {
        t.setField(v.simpleName, m[name]);
      }
    }
  }
}
