import 'dart:convert';
import "./reflector/Reflector.dart";
import "./jsonable_reflect.dart";

mixin mixinMap {
  fromMap(Map<String, dynamic> values) {
    rawfromMap(this, values);
  }

  Map<String, dynamic> toMap() {
    return mapable(this);
  }
}

Map<String, dynamic> _makeMap(String name, dynamic value) {
  Map<String, dynamic> result = {};
  if (value is List<JsonableReflect>) {
    result.addAll({name: value.map((v) => mapable(v)).toList()});
  } else if (value is List<MapableReflect>) {
    result.addAll({name: value.map((v) => v.toMap()).toList()});
  } else if (value is JsonableReflect) {
    result.addAll({name: mapable(value)});
  } else if (value is MapableReflect) {
    result.addAll({name: value.toMap()});
  } else {
    result.addAll({name: value});
  }

  return result;
}

dynamic mapable(Object o) {
  if (o is List) {
    return o.map((val) => mapable(val)).toList();
  }
  if (o is Map) {
    return o.map((k, val) => MapEntry(k, mapable(val)));
  }

  var r = reflection(o);
  Map<String, dynamic> result = {};
  for (var variable in r.variables) {
    if (variable.exclude == true) continue;
    var value = variable.value;
    result.addAll(_makeMap(variable.stringName, value));
  }
  for (var getter in r.getters) {
    if (getter.exclude == true) continue;
    var value = getter.value;
    result.addAll(_makeMap(getter.stringName, value));
  }
  return result;
}

/// This method is internal,  don't show in public API to programmers.
dynamic rawfromMap(dynamic o, Map<String, dynamic> data) {
  var t = reflection(o);

  for (var variable in t.variables) {
    if (variable.exclude == true) continue;
    if (data.containsKey(variable.stringName)) {
      if (variable.value is MapableReflect) {
        variable.value.fromMap(data[variable.stringName]);
      } else if (variable.value is JsonableReflect) {
        // Here I am checking if the value is a map so as not to generate errors due to non-comparison.
        if (data[variable.stringName] is Map) {
          String j = jsonEncode(data[variable.stringName]);
          variable.value.fromJson(j);
        }
      } else {
        t.instance.setField(variable.name, data[variable.stringName]);
      }
    }
  }
  for (var setter in t.setters) {
    if (data.containsKey(setter.stringName)) {
      t.instance.invoke(setter.name, [data[setter.stringName]]);
    }
  }
  return o;
}

List<E> mapableList<E>(List<Map<dynamic, dynamic>> values) {
  throw "not implemented";
}
