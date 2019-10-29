import 'package:jsonable/jsonable.dart';
import "./exceptions.dart";

abstract class Rule<E> {
  bool Function(E) function;
  Rule(this.function);
  JsonableException Function(E) exceptionBuilder;
  bool test(E value) {
    return this.function(value);
  }
}

class RuleJtype implements Rule<JType> {
  @override
  bool Function(JType) function;

  JsonableException Function(JType) exceptionBuilder;

  RuleJtype(this.function, {this.exceptionBuilder});
  @override
  bool test(JType value) {
    return this.function(value);
  }
}

/// future implementation
class RuleJsonable implements Rule<Jsonable> {
  @override
  bool Function(Jsonable) function;
  RuleJsonable(this.function, {this.exceptionBuilder});
  JsonableException Function(Jsonable) exceptionBuilder;
  @override
  bool test(Jsonable value) {
    return this.function(value);
  }
}

class Rules {
  static Rule min(int min) {
    return RuleJtype(
      (v) {
        if (v.get != null) {
          if (v is JString || v is JList) return v.get.length > min;
          if (v is JNum) return v.get > min;
        }
        return true;
      },
      exceptionBuilder: (v) => MinRuleException("${v.keyname} < $min"),
    );
  }

  static Rule max(int max) {
    return RuleJtype(
      (v) {
        if (v.get != null) {
          if (v is JString || v is JList) return v.get.length < max;
          if (v is JNum) return v.get < max;
        }
        return true;
      },
      exceptionBuilder: (v) => MinRuleException("${v.keyname} < $min"),
    );
  }

  static Rule len(int len) => RuleJtype((v) {
        if (v.get != null) {
          if (v is JString || v is JList) return v.get.length == len;
        }
        return true;
      });

  static Rule equal(dynamic value) => RuleJtype((v) {
        if (v.get != null) {
          if (v is JString && value is String) return v.get == value;
          if (v is JNum && value is num) return v.get == value;
          if (v is JNum && value is int) return v.get == value;
          if (v is JNum && value is double) return v.get == value;
          if (v is JList && value is List) return v.get == value;
        }

        return true;
      });

  static Rule oneOf(List elements) => RuleJtype((v) {
        for (var e in elements) {
          if (e == v.get) {
            return true;
          }
        }
        return false;
      });

  static Rule required() => RuleJtype((v) {
        if (v.get == null) return false;
        if (v is JString && v.get == "") return false;
        return true;
      });

  static Rule requiredWith(List<String> fields) {}
  static Rule requiredWithout(List<String> fields) {}
  static Rule notEqual(dynamic value) {}
  static Rule gte(num value) {}
  static Rule lte(num value) {}
  static Rule lt(num value) {}
  static Rule gt(num value) {}
  static Rule isEmail() {}
  static Rule isNumber() {}
  static Rule isInt() {}
  static Rule isDouble() {}
  static Rule isDate() {}
  static Rule isDateTime() {}
  static Rule isURL() {}
  static Rule regex(RegExp regex) {}
}
