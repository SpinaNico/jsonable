import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/scheme/JsonNode.dart';
import 'package:jsonable/src/scheme/JsonSchema.dart';
import 'package:jsonable/src/scheme/MapList.dart';
import 'package:jsonable/src/typing/CJbool.dart';
import 'package:jsonable/src/typing/CJclass.dart';
import 'package:jsonable/src/typing/CJlist.dart';
import 'package:jsonable/src/typing/CJnum.dart';
import 'package:jsonable/src/typing/CJstring.dart';

dynamic encodeJsonSchema(JsonSchema root) {
  MapList result;
  for (JsonEntry entry in root) {
    if (result == null)
      entry.keyname == null ? result = MapList([]) : result = MapList({});

    if (entry is JsonNode) {
      if (entry.value is JsonType)
        result.add(entry);
      else
        result.add(JsonEntry(entry.keyname, encodeJsonSchema(entry.value)));
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

  if (jsonType is CJlist && value is List) {
    if (jsonType is CJlist<Jsonable> ||
        jsonType is CJlist<CJclass> ||
        jsonType is CJlist<Jclass>) {
      jsonType.createElements(value);
    }
  }
  if (jsonType is CJclass && value is Map) {
    jsonType.value.fromMap(value);
  }
}
