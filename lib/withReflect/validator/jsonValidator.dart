import "../jsonable_reflect.dart";
import 'package:jsonable/withReflect/reflector/Reflector.dart';

JsonableReportError validate(Object o, {JsonableReportError report}) {
  if (report == null) report = JsonableReportError();

  var reflect = reflection(o);
  for (var variable in reflect.variables) {
    if (variable.type is Mapable || variable.value is Jsonable) {
      validate(variable.value, report: report);
    } else {
      report.errors
          .addAll(variable.validate(variable.stringName, variable.value));
    }
  }
  for (var getter in reflect.getters) {
    if (getter.type is Mapable || getter.value is Jsonable) {
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
