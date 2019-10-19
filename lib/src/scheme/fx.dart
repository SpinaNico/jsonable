import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/scheme/JsonSchema.dart';
import 'package:jsonable/src/typing/CJbool.dart';
import 'package:jsonable/src/typing/CJclass.dart';
import 'package:jsonable/src/typing/CJdynamic.dart';
import 'package:jsonable/src/typing/CJlist.dart';
import 'package:jsonable/src/typing/CJmap.dart';
import 'package:jsonable/src/typing/CJnum.dart';
import 'package:jsonable/src/typing/CJstring.dart';

dynamic encodeJsonSchema(JsonSchema root) {
  Map result = {};
  root.forEach((key, type) {
    if (type is CJclass<Jsonable>) {
      return result[key] = type.get.toMap();
    } else if (type is CJlist<Jsonable>) {
      return result[key] = type.map((Jsonable val) => val.toMap()).toList();
    } else if (type is CJmap<dynamic, Jsonable>) {
      return result[key] = type.map((key, val) {
        return MapEntry(key, val.toMap());
      });
    } else
      return result[key] = type.get;
  });
  return result != null ? result : {};
}

decodeJsonSchema(Map<dynamic, dynamic> raw, JsonSchema scheme) {
  scheme.forEach((key, value) {
    if (raw.containsKey(key)) {
      if (value is CJclass) {
        scheme[key].get.fromMap(raw[key]);
      } else if (value is JType) {
        _combinerJTypeNormalType(scheme[key], raw[key]);
      }
    }
  });
}

_combinerJTypeNormalType(JType jsonType, dynamic value) {
  if (value == null) return;
  if (jsonType is CJdynamic) {
    jsonType.set(value);
    return;
  }
  if (jsonType is CJstring && value is String) {
    jsonType.set(value);
    return;
  }

  if (jsonType is CJnum && (value is num || value is int || value is double)) {
    jsonType.set(value);
    return;
  }

  if (jsonType is CJbool && value is bool) {
    jsonType.set(value);
    return;
  }
  if (jsonType is CJlist<Jsonable> && value is List) {
    jsonType.createElements(value);
    return;
  }

  if (jsonType is CJmap && value is Map) {
    if (jsonType is CJmap<dynamic, Jsonable> && value is Map) {
      jsonType.createElements(value);
      return;
    }
    jsonType.set(value);
    return;
  }

  if (jsonType is CJlist && value is List) {
    if (jsonType is JList<String> && value is List) {
      jsonType.set(value.cast<String>());
      return;
    }
    if (jsonType is CJlist<bool> && value is List) {
      jsonType.set(value.cast<bool>());
      return;
    }
    if (jsonType is CJlist<num> && value is List) {
      jsonType.set(value.cast<num>());
      return;
    }
    if (jsonType is CJlist<int> && value is List) {
      jsonType.set(value.cast<int>());
      return;
    }
    if (jsonType is CJlist<double> && value is List) {
      jsonType.set(value.cast<double>());
      return;
    }
    if (jsonType is CJlist<Map> && value is List) {
      jsonType.set(value.cast<Map>());
      return;
    }
    if (jsonType is CJlist && value is List) {
      jsonType.set(value);
    }
    return;
  }
}
