import 'package:jsonable/jsonable.dart';

// typedef Rule = bool Function(JType, Object);

// Rule test_min = (value, int lenExpect) {
//   if (value is JString) {}
//   return false;
// };
//   int len,
//   num max,
//   num min,
//   List oneOf,
//   RegExp regex,
//   dynamic notEgual,
//   dynamic egual,
//   bool required,
//   bool reserved,
//   List<String> requiredWidth,
//   List<String> requiredWithout,
//   String badCharacter,

class Rule {
  bool Function(JType) function;
  Rule(this.function);

  bool test(JType value) {
    return this.function(value);
  }
}

var minRule = (int min) => Rule((v) {
      if (v.get != null) {
        if (v is JString || v is JList) return v.get.length > min;
        if (v is JNum) return v.get > min;
      }
      return true;
    });

var maxRule = (int max) => Rule((v) {
      if (v.get != null) {
        if (v is JString || v is JList) return v.get.length < max;
        if (v is JNum) return v.get < max;
      }
      return true;
    });

/// LenRule get one rule for len
var lenRule = (int len) => Rule((v) {
      if (v.get != null) {
        if (v is JString || v is JList) return v.get.length == len;
      }
      return true;
    });

var equalRule = (dynamic value) => Rule((v) {
      if (v.get != null) {
        if (v is JString && value is String) return v.get == value;
        if (v is JNum && value is num) return v.get == value;
        if (v is JNum && value is int) return v.get == value;
        if (v is JNum && value is double) return v.get == value;
        if (v is JList && value is List) return v.get == value;
      }

      return true;
    });
