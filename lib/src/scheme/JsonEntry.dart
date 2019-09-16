import 'package:jsonable/src/scheme/JsonNode.dart';

class JsonEntry<E, JsonType> implements JsonNode {
  E keyname;
  JsonType value;
  JsonEntry(this.keyname, this.value);
}
