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

abstract class JsonableException implements Exception {}

class MinRuleException extends JsonableException {}

abstract class Rule<E> {
  bool Function(E) function;
  Rule(this.function);

  bool test(E value) {
    return this.function(value);
  }
}

class RuleJtype implements Rule<JType> {
  @override
  bool Function(JType) function;
  RuleJtype(this.function);
  @override
  bool test(JType value) {
    return null;
  }
}

class RuleJsonable implements Rule<Jsonable> {
  @override
  bool Function(Jsonable) function;
  RuleJsonable(this.function);

  @override
  bool test(Jsonable value) {
    return null;
  }
}

class Rules {
  Rule min(int min) {
    return RuleJtype((v) {
      if (v.get != null) {
        if (v is JString || v is JList) return v.get.length > min;
        if (v is JNum) return v.get > min;
      }
      return true;
    });
  }

  Rule max(int max) {
    return RuleJtype((v) {
      if (v.get != null) {
        if (v is JString || v is JList) return v.get.length < max;
        if (v is JNum) return v.get < max;
      }
      return true;
    });
  }

  Rule len(int len) => RuleJtype((v) {
        if (v.get != null) {
          if (v is JString || v is JList) return v.get.length == len;
        }
        return true;
      });

  Rule equal(dynamic value) => RuleJtype((v) {
        if (v.get != null) {
          if (v is JString && value is String) return v.get == value;
          if (v is JNum && value is num) return v.get == value;
          if (v is JNum && value is int) return v.get == value;
          if (v is JNum && value is double) return v.get == value;
          if (v is JList && value is List) return v.get == value;
        }

        return true;
      });

  Rule oneOf(List elements) => RuleJtype((v) {
        for (var e in elements) {
          if (e == v.get) {
            return true;
          }
        }
        return false;
      });

  Rule required() => RuleJtype((v) {
        if (v.get == null) return false;
        if (v is JString && v.get == "") return false;
        return true;
      });
}
