import "dart:convert";
import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/_comparate.dart';
import "./_typing.dart";
import "./_manger.dart";

mixin mixinJsonable implements Jsonable {
  final JsonManager _instance = JsonManager();
  Jstring jString(String keyname, {validation, String initialValue}) {
    return this
        ._instance
        .add(keyname, new CJstring(initialValue: initialValue));
  }

  Jbool jBool(String keyname, {validation, bool initialValue}) {
    return this._instance.add(keyname, new CJbool(initialValue: initialValue));
  }

  Jnum jNum(String keyname, {validation, num initialValue}) {
    return this._instance.add(keyname, new CJnum(initialValue: initialValue));
  }

  Jobject jObject(String keyname, JsonableConstructor constructor) {
    if (constructor == null)
      throw "oh, no!!! you don't set null JsonableConstructor";
    return this._instance.add(keyname, CJobject(constructor));
  }

  Jlist jList<E>(String keyname, {validation, List<E> initialValue}) {
    return this._instance.add(keyname, CJlist(initialValue: initialValue));
  }

  List<dynamic> fromJsonList(String listJson, JsonableConstructor contructor) {
    var data = jsonDecode(listJson);
    if (data is Map) {
      throw """fromJsonList does not support Map as a result of Json. use fromJson""";
    } else if (data is List) {
      return data.map((v) {
        var _instance = contructor();
        if (v is Map) return _instance.fromMap(v);
        if (v is List<Map>)
          return _instance.fromMapList(v, contructor);
        else if (data is List) return data;
      }).toList();
    } else
      throw "I can't manage the data correctly, the answer is not a list and it's not even a Map. sourceJson: $data";
  }

  fromJson(String json) {
    var data = jsonDecode(json);
    if (data is List) {
      throw """fromJson does not support lists as a result of Json. use fromJsonList""";
    } else if (data is Map) {
      this.fromMap(data);
    } else
      throw "I can't manage the data correctly, the answer is not a list and it's not even a Map. sourceJson:$data";
  }

  String toJson() {
    return jsonEncode(this.toMap());
  }

  List<Jsonable> fromMapList(List<Map> map, JsonableConstructor constructor) {
    return List.from(map.map((value) {
      var _i = constructor();
      _i.fromMap(value);
      return _i;
    }).toList());
  }

  fromMap(Map value) {
    value.keys.forEach((key) {
      if (this._instance.elements.containsKey(key)) {
        if (comparateToDartType(this._instance.elements[key], value[key])) {
          this._instance.elements[key].value = value[key];
        } else {
          throw "oh no! ${value[key].runtimeType} type is not assignable to ${this._instance.elements[key].runtimeType}";
        }
      }
    });
  }

  Map toMap() {
    return this._instance.elements.map((k, v) => MapEntry(k, (() {
          if (v is Jobject)
            return v.value.toMap();
          else
            return v.value;
        })()));
  }

  dynamic validate() {
    //TODO:
  }
}
