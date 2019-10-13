import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/scheme/JsonSchema.dart';
import 'package:jsonable/src/validator/exceptions.dart';
import 'package:jsonable/src/validator/validator.dart';
import "./CJlist.dart";

class Typer {
  JsonSchema schema = JsonSchema.newScheme({});

  List<JsonableValidatorException> validate({keyname}) {
    List<JsonableValidatorException> errors = [];
    for (var key in this.schema.keys) {
      errors.addAll(((this.schema[key] as JType).validator as CValidator)
          .errors(
              this.schema[key], "$keyname${keyname != null ? "." : ""}$key"));
    }
    return errors;
  }

  E registerType<E extends JType>(String keyname, JType value) {
    _rules(value);
    this.schema[keyname] = value;
    return value;
  }
}

_rules(value) {
  if (value is JList) {
    if (value is CJlist<JType>) {
      throw "you can't use JType inside aJList";
    }
  }
}
