import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/scheme/JsonSchema.dart';
import "./CJlist.dart";

class Typer {
  JsonSchema schema = JsonSchema.newScheme({});

  E registerType<E extends JsonType>(String keyname, JsonType value) {
    _rules(value);
    this.schema[keyname] = value;
    return value;
  }
}

_rules(value) {
  if (value is Jlist) {
    if (value is CJlist<JsonType>) {
      throw "you can't use JsonType inside a Jlist";
    }
  }
}
