import 'package:jsonable/jsonable.dart';

bool comparateToDartType(JsonType jsonType, Type type) {
  if (jsonType is Jstring && type is String) return true;
  if (jsonType is Jnum && (type is num || type is int || type is double))
    return true;
  if (jsonType is Jbool && type is bool) return true;

  if (jsonType is Jobject && type is Map) return true;
  if (jsonType is Jlist && type is List) return true;
  return false;
}
