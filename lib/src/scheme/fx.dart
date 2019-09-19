import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/scheme/JsonSchema.dart';
import 'package:jsonable/src/typing/CJDynamic.dart';
import 'package:jsonable/src/typing/CJbool.dart';
import 'package:jsonable/src/typing/CJclass.dart';
import 'package:jsonable/src/typing/CJlist.dart';
import 'package:jsonable/src/typing/CJnum.dart';
import 'package:jsonable/src/typing/CJstring.dart';

dynamic encodeJsonSchema(JsonSchema root) {
  Map result = root.map((key, type) {
    if (type is Jclass) {
      return MapEntry(key, type.value.toMap());
    } else if (type is Jlist<Jsonable>) {
      return MapEntry(
          key,
          type
              .map((Jsonable val) => val.toMap())
              .toList()); //[encodeJsonSchema(r.value)]);
    } else
      return MapEntry(key, type.value);
  });
  return result != null ? result : {};
}

decodeJsonSchema(Map<dynamic, dynamic> raw, JsonSchema scheme) {
  scheme.forEach((key, value) {
    if (raw.containsKey(key)) {
      if (value is CJclass) {
        scheme[key].value.fromMap(raw[key]);
      } else if (value is JType) {
        _combinerJTypeNormalType(scheme[key], raw[key]);
      }
    }
  });
}

_combinerJTypeNormalType(JType JType, dynamic value) {
  if (value == null) return;
  if (JType is CJdynamic) {
    JType.value = value;
    return;
  }
  if (JType is CJstring && value is String) {
    JType.value = value;
    return;
  }

  if (JType is CJnum && (value is num || value is int || value is double)) {
    JType.value = value;
    return;
  }

  if (JType is CJbool && value is bool) {
    JType.value = value;
    return;
  }
  if (JType is CJlist<Jsonable> && value is List) {
    JType.createElements(value);
    return;
  }
  if (JType is CJlist && value is List) {
    if (JType is Jlist<String> && value is List) {
      JType.value = value.cast<String>();
      return;
    }
    if (JType is Jlist<bool> && value is List) {
      JType.value = value.cast<bool>();
      return;
    }
    if (JType is Jlist<num> && value is List) {
      JType.value = value.cast<num>();
      return;
    }
    if (JType is Jlist<int> && value is List) {
      JType.value = value.cast<int>();
      return;
    }
    if (JType is Jlist<double> && value is List) {
      JType.value = value.cast<double>();
      return;
    }
    if (JType is Jlist<Map> && value is List) {
      JType.value = value.cast<Map>();
      return;
    }
    return;
  }
}
