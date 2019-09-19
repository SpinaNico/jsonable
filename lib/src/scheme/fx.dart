import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/scheme/JsonSchema.dart';
import 'package:jsonable/src/typing/CJbool.dart';
import 'package:jsonable/src/typing/CJclass.dart';
import 'package:jsonable/src/typing/CJlist.dart';
import 'package:jsonable/src/typing/CJnum.dart';
import 'package:jsonable/src/typing/CJstring.dart';

dynamic encodeJsonSchema(JsonSchema root) {
  Map result = {};
  for (var key in root.keys) {
    if (root[key] is Jclass) {
      result[key] = root[key].value.toMap();
    } else if (root[key] is Jlist<Jsonable>) {
      result[key] = root[key]
          .value
          .map((Jsonable val) => val.toMap())
          .toList(); //[encodeJsonSchema(r.value)]);
    } else
      result[key] = root[key].value;
  }

  return result != null ? result : {};
}

decodeJsonSchema(Map<dynamic, dynamic> raw, JsonSchema scheme) {
  for (MapEntry entry in scheme.entries) {
    if (raw.containsKey(entry.key)) {
      if (entry.value is CJclass) {
        entry.value.value.fromMap(raw[entry.key]);
      } else if (entry.value is JsonType) {
        _combinerJsonTypeNormalType(entry.value, raw[entry.key]);
      }
    }
  }
}

_combinerJsonTypeNormalType(JsonType jsonType, dynamic value) {
  if (value == null) return;

  if (jsonType is CJstring && value is String) {
    jsonType.value = value;
    return;
  }

  if (jsonType is CJnum && (value is num || value is int || value is double)) {
    jsonType.value = value;
    return;
  }

  if (jsonType is CJbool && value is bool) {
    jsonType.value = value;
    return;
  }
  if (jsonType is CJlist<Jsonable> && value is List) {
    jsonType.createElements(value);
    return;
  }
  if (jsonType is CJlist && value is List) {
    if (jsonType is Jlist<String> && value is List) {
      jsonType.value = value.cast<String>();
      return;
    }
    if (jsonType is Jlist<bool> && value is List) {
      jsonType.value = value.cast<bool>();
      return;
    }
    if (jsonType is Jlist<num> && value is List) {
      jsonType.value = value.cast<num>();
      return;
    }
    if (jsonType is Jlist<int> && value is List) {
      jsonType.value = value.cast<int>();
      return;
    }
    if (jsonType is Jlist<double> && value is List) {
      jsonType.value = value.cast<double>();
      return;
    }
    if (jsonType is Jlist<Map> && value is List) {
      jsonType.value = value.cast<Map>();
      return;
    }
    return;
  }
}
