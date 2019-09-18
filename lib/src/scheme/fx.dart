import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/scheme/JsonSchema.dart';
import 'package:jsonable/src/scheme/MapList.dart';
import 'package:jsonable/src/typing/CJbool.dart';
import 'package:jsonable/src/typing/CJclass.dart';
import 'package:jsonable/src/typing/CJlist.dart';
import 'package:jsonable/src/typing/CJnum.dart';
import 'package:jsonable/src/typing/CJstring.dart';

dynamic encodeJsonSchema(root) {
  MapList result;
  for (JsonEntry entry in root) {
    if (result == null)
      entry.keyname == null ? result = MapList([]) : result = MapList({});

    if (entry.value is JsonType || entry.value is JsonSchema) {
      if (entry.value is JsonSchema) {
        result.add(entry.keyname, encodeJsonSchema(entry.value));
      } else if (entry.value is Jlist<Jsonable>) {
        //print(" ${entry.value.length} ${entry.value.value.runtimeType}");
        for (var r in entry.value) {
          result.add(entry.keyname, [encodeJsonSchema(r.value)]);
        }
      } else
        result.add(entry.keyname, entry.value.value);
    } else {
      throw "(encode) FatalError SchemaError: Value in JsonEntry.value don't accept ${entry.value.runtimeType}";
    }
  }

  if (result != null) {
    /// Here they return either the list or the map
    return result.value;
  } else
    return {};
}

decodeJsonSchema(Map<dynamic, dynamic> raw, JsonSchema scheme) {
  for (JsonEntry entry in scheme) {
    if (raw.containsKey(entry.keyname)) {
      if (entry.value is JsonType) {
        _combinerJsonTypeNormalType(entry.value, raw[entry.keyname]);
      } else if (entry.value is JsonSchema) {
        decodeJsonSchema(raw[entry.keyname], entry.value);
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
