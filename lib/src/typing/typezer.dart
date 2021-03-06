import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/scheme/JsonSchema.dart';

import "./CJlist.dart";

class Typer {
  JsonSchema schema = JsonSchema.newScheme({});

  E registerType<E extends JType>(String keyname, JType value) {
    _rules(value);
    schema[keyname] = value;
    return value as E;
  }
}

_rules(value) {
  if (value is JList) {
    if (value is CJlist<JType>) {
      throw "you can't use JType inside aJList";
    }
  }
}
