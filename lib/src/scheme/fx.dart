import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/scheme/JsonNode.dart';
import 'package:jsonable/src/scheme/JsonSchema.dart';
import 'package:jsonable/src/scheme/MapList.dart';

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
      throw "FatalError SchemaError: Value in JsonEntry.value don't accept ${entry.value.runtimeType}";
    }
  }

  if (result != null)
    return result.value;
  else {
    return {};
  }
}
