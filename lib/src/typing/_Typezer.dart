import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/scheme/JsonSchema.dart';

class Typer {
  JsonSchema schema = JsonSchema.newScheme([]);

  E registerType<E extends JsonType>(String keyname, JsonType value) {
    this.schema.add(new JsonEntry(keyname, value));
    return value;
  }
}
