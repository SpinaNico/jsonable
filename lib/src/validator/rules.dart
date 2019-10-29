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
  static Rule min(int min, {String message}) {
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

  static Rule max(int max, {String message}) {
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

  static Rule len(int len, {String message}) => RuleJtype((v) {
        if (v.get != null) {
          if (v is JString || v is JList) return v.get.length == len;
        }
        return true;
      });

  static Rule equal(dynamic value, {String message}) => RuleJtype((v) {
        if (v.get != null) {
          if (v is JString && value is String) return v.get == value;
          if (v is JNum && value is num) return v.get == value;
          if (v is JNum && value is int) return v.get == value;
          if (v is JNum && value is double) return v.get == value;
          if (v is JList && value is List) return v.get == value;
        }

        return true;
      });

  static Rule oneOf(List elements, {String message}) => RuleJtype((v) {
        for (var e in elements) {
          if (e == v.get) {
            return true;
          }
        }
        return false;
      });

  static Rule required({String message}) => RuleJtype((v) {
        if (v.get == null) return false;
        if (v is JString && v.get == "") return false;
        return true;
      });

  static Rule requiredWith(List<String> fields, {String message}) {
    return RuleJtype(
      (v) {
        if (v.get == null || (v is JString && v.get == ""))
          return false;
        else {
          return fields
              .map<bool>((element) {
                if (v.parent[element] == null) return false;
                if (v.parent[element].get == null ||
                    (v.parent[element] is JString && v.parent[element] == ""))
                  return false;
                return true;
              })
              .toList()
              .every((ele) => ele == true);
        }
      },
      exceptionBuilder: (v) => RequiredWithRuleExcpetion(""),
    );
  }

  static Rule requiredWithout(List<String> fields, {String message}) {}
  static Rule notEqual(dynamic value, {String message}) {}
  static Rule gte(num value, {String message}) {}
  static Rule lte(num value, {String message}) {}
  static Rule lt(num value, {String message}) {}
  static Rule gt(num value, {String message}) {}
  static Rule isEmail({String message}) {}
  static Rule isNumber({String message}) {}
  static Rule isInt({String message}) {}
  static Rule isDouble({String message}) {}
  static Rule isDate({String message}) {}
  static Rule isDateTime({String message}) {}
  static Rule isURL({String message}) {}
  static Rule regex(RegExp regex) {}
}
