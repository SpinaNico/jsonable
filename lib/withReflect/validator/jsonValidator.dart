import "../jsonable_reflect.dart";
import 'package:jsonable/withReflect/reflector/Reflector.dart';

JsonableReportError validate(Object o, {JsonableReportError report}) {
  if (report == null) report = JsonableReportError();

  var reflect = reflection(o);
  for (var variable in reflect.variables) {
    if (variable.type is MapableReflect || variable.value is JsonableReflect) {
      validate(variable.value, report: report);
    } else {
      report.errors
          .addAll(variable.validate(variable.stringName, variable.value));
    }
  }
  for (var getter in reflect.getters) {
    if (getter.type is MapableReflect || getter.value is JsonableReflect) {
      validate(getter.value, report: report);
    } else {
      report.errors.addAll(getter.validate(getter.stringName, getter.value));
    }
  }
  if (report.errors.length > 0) {
    report.error = true;
  }
  return report;
}
