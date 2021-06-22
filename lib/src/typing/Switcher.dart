import 'package:jsonable/jsonable.dart';

switcher(
  JType value, {
  Function(JString)? jstring,
  Function(JNum)? jnum,
  Function(JBool)? jbool,
  Function(JClass)? jclass,
  Function(JList)? jlist,
  Function(JList<Jsonable>)? jlisJsonable,
  Function(JDynamic)? jdynamic,
  Function(JMap)? jmap,
  Function(JType)? jtypeDefault,
}) {
  if (value is JDynamic && jdynamic != null) {
    jdynamic(value);
    return;
  }

  if (value is JClass && value is Jsonable && jclass != null) {
    jclass(value);
    return;
  }

  if (value is JString && value is String && jstring != null) {
    jstring(value);
    return;
  }

  if (value is JNum &&
      (value is num || value is int || value is double) &&
      jnum != null) {
    jnum(value);
    return;
  }

  if (value is JBool && value is bool && jbool != null) {
    jbool(value);
    return;
  }
  if (value is JList<Jsonable> && value is List && jlisJsonable != null) {
    jlisJsonable(value);
    return;
  }

  if (value is JMap && value is Map && jmap != null) {
    jmap(value);
    return;
  }

  if (value is JList && value is List && jlist != null) {
    jlist(value);
    return;
  }

  if (jtypeDefault != null && value is JType) {
    jtypeDefault(value);
    return;
  }

  throw """
  Something is not good, I can't handle this type "value:${value.runtimeType}"
  """;
}
