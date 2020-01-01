import 'package:jsonable/jsonable.dart';
import './exceptions.dart';

abstract class Rule {
  bool Function(JType) function;
  Rule(this.function);
  RuleException Function(JType) exceptionBuilder;
  bool test(JType value) {
    return function(value);
  }
}

bool _isEmpitJType(JType value) {
  if (value == null) return true;
  if (value.value == null || (value is JString && value.value == '')) {
    return true;
  }
  return false;
}

class RuleJtype implements Rule {
  @override
  bool Function(JType) function;

  RuleException Function(JType) exceptionBuilder;

  RuleJtype(this.function, {this.exceptionBuilder});
  @override
  bool test(JType value) {
    return function(value);
  }
}

/// future implementation
// class RuleJsonable extends Rule {
//   @override
//   bool Function(Jsonable) function;
//   RuleJsonable(this.function, {this.exceptionBuilder});

//   bool test(Jsonable value) {
//     return this.function(value);
//   }
// }

abstract class Rules {
  ///This rule works with the following types: `JString, JNum, JList`
  /// * it is a `JString` check the length of the characters are greater than the minimum.
  /// * `JNum` it behaves like `Rules.lt`: check that the value is not below min
  /// * `JList` check the number of items
  static Rule min(int min, {String message}) {
    return RuleJtype(
      (v) {
        if (v.value != null) {
          if (v is JString || v is JList) {
            return v.value.length < min;
          }
          if (v is JNum) {
            return v.value < min;
          }
        }
        return false;
      },
      exceptionBuilder: (v) => MinRuleException("${v.keyname} < $min"),
    );
  }

  ///This rule works with the following types: `JString, JNum, JList`
  static Rule max(int max, {String message}) {
    return RuleJtype(
      (v) {
        if (v.value != null) {
          if (v is JString || v is JList) {
            return v.value.length > max;
          }
          if (v is JNum) {
            return v.value > max;
          }
        }
        return false;
      },
      exceptionBuilder: (v) => MaxRuleExcpetion("${v.keyname} > $max"),
    );
  }

  /// ///This rule works with the following types: `JString, JList`
  /// check the length of a JList or JString
  static Rule len(int len, {String message}) {
    return RuleJtype((v) {
      if (v.value != null) {
        if (v is JString || v is JList) {
          if (v.value.length == len) {
            return false;
          } else {
            return true;
          }
        }
      }
      return false;
    },
        exceptionBuilder: (v) =>
            LenRuleExcepeion(message != null ? message : "is len"));
  }

  /// This rule works with the following types: `JString, JNum, JList, JBool`
  ///
  static Rule equal(dynamic value, {String message}) {
    return RuleJtype((v) {
      if (v.value != null) {
        if (v is JString && value is String ||
            v is JNum && value is num ||
            v is JBool && value is bool) {
          if (v.value == value) {
            return false;
          } else {
            return true;
          }
        }
        if (v is JList && value is List) {
          if (v == value) {
            return false;
          } else
            return true;
        }
      }

      return true;
    }, exceptionBuilder: (v) {
      return EqualRuleExcpetion(message != null ? message : " not equal");
    });
  }

  ///This rule works with the following types: `JString, JNum, JList, JBool, JDynamic, JType`
  static Rule oneOf(List elements, {String message}) {
    return RuleJtype((v) {
      for (var e in elements) {
        if (e == v.value) {
          return false;
        }
      }
      return true;
    });
  }

  /// This rule works with the following types: `JString, JBool, JList`
  ///Check that a field is not null, reporting the error with validate
  static Rule required({String message}) {
    return RuleJtype((v) {
      if (v is JBool) {
        if (v.value == false)
          return true;
        else
          return false;
      }
      return _isEmpitJType(v);
    }, exceptionBuilder: (v) {
      return RequiredRuleExcpetion(
          message != null ? message : "${v.keyname} is required");
    });
  }

  /// ///This rule works with the following types: `ALL`
  ///This field will be checked, if it is not null or empty.
  /// if it is not null / void all the fields indicated in
  /// fields that are not empty / void will be checked
  /// if it fails return in validate method; RequiredWithRuleExcpetion
  static Rule requiredWith(List<String> fields, {String message}) {
    return RuleJtype(
      (v) {
        if (_isEmpitJType(v) == false) {
          return fields
              .map<bool>((element) => _isEmpitJType(v.parent[element]))
              .toList()
              .any((ele) => ele == true);
        }
        return false;
      },
      exceptionBuilder: (v) {
        var f = fields.join(", ");
        return RequiredWithRuleExcpetion(message != null
            ? message
            : "${v.keyname} requires with fields: $f");
      },
    );
  }

  ///This rule works with the following types: `ALL`
  static Rule requiredWithout(List<String> fields, {String message}) {
    return RuleJtype((v) {
      if (_isEmpitJType(v)) {
        return fields
            .map<bool>((element) => _isEmpitJType(v))
            .toList()
            .any((ele) => ele == true);
      }

      return false;
    }, exceptionBuilder: (v) {
      var f = fields.join(", ");
      return RequiredWithoutRuleExcpetion(message != null
          ? message
          : "${v.keyname} required without fields: $f");
    });
  }

  ///This rule works with the following types: `JString, JNum, JList, JBool`
  static Rule notEqual(dynamic value, {String message}) {
    return RuleJtype((v) {
      if (v is JNum && (value is int || value is double || value is num)) {
        return v.value != value;
      }

      if (v is JString && value is String) if (v.value != value) {
        return false;
      } else {
        return true;
      }
      if (v is JList && value is List) {
        if (v != value) {
          return false;
        } else
          return true;
      }
      if (v is JBool && value is bool) {
        if (v.value != value) {
          return false;
        } else
          return true;
      }

      return false;
    }, exceptionBuilder: (v) {
      return NotEqualRuleExcpetion(
          message != null ? message : "${v.keyname} != $value");
    });
  }

  ///This rule works with the following types: `JNum`
  static Rule gte(num value, {String message}) {
    return RuleJtype((v) {
      if (v is JNum && (value is int || value is double || value is num)) {
        return v.value >= value;
      }
      return true;
    }, exceptionBuilder: (v) {
      return GteRuleExcpetion(
          message != null ? message : "${v.keyname} <= $value");
    });
  }

  ///This rule works with the following types: `JNum`
  static Rule lte(num value, {String message}) {
    return RuleJtype((v) {
      if (v is JNum && (value is int || value is double || value is num)) {
        return v.value <= value;
      }
      return true;
    }, exceptionBuilder: (v) {
      return LteRuleExcpetion(
          message != null ? message : "${v.keyname} <= $value");
    });
  }

  ///This rule works with the following types: `JNum`
  static Rule lt(num value, {String message}) {
    return RuleJtype((v) {
      if (v is JNum && (value is int || value is double || value is num)) {
        return v.value < value;
      }
      return true;
    }, exceptionBuilder: (v) {
      return LtRuleExcpetion(
          message != null ? message : "${v.keyname} < $value");
    });
  }

  ///This rule works with the following types: `JNum`
  static Rule gt(num value, {String message}) {
    return RuleJtype((v) {
      if (v is JNum && (value is int || value is double || value is num)) {
        return v.value > value;
      }
      return true;
    }, exceptionBuilder: (v) {
      return GtRuleExcpetion(
          message != null ? message : "${v.keyname} > $value");
    });
  }

  ///This rule works with the following types: `JString`
  static Rule isEmail({String message}) {
    return RuleJtype((v) {
      if (v is JString) {
        var r = RegExp(r"^[A-z0-9\.\+_-]+@[A-z0-9\._-]+\.[A-z]{2,6}$");
        var q = r.allMatches(v.value);
        return q.length == 0;
      }

      return true;
    }, exceptionBuilder: (v) {
      return IsEmailRuleExcpetion(
          message != null ? message : "${v.keyname} is not valid email");
    });
  }

  ///This rule works with the following types: `JString`
  static Rule isNumber({String message}) {
    return RuleJtype((v) {
      if (v is JString) {
        if (!_isEmpitJType(v)) {
          var e = num.tryParse(v.value);
          if (e != null) {
            return false;
          }
        }
        return true;
      }
      return false;
    }, exceptionBuilder: (v) {
      return IsNumberRuleExcpetion(message != null
          ? message
          : "${v.keyname} is not valid number (${v.value})");
    });
  }

  ///This rule works with the following types: `JString`
  static Rule isInt({String message}) {
    return RuleJtype((v) {
      if (v is JString) {
        if (!_isEmpitJType(v)) {
          var e = int.tryParse(v.value);
          if (e == null) {
            return true;
          }
        }
        return false;
      }
      return false;
    }, exceptionBuilder: (v) {
      return IsIntRuleExcpetion(message != null
          ? message
          : "${v.keyname} is not valid int (${v.value})");
    });
  }

  ///This rule works with the following types: `JString`
  /// This rule checks if the string contained in JString is a valid double.
  ///The rule makes no distinction between "." (dot) or "," (comma).
  static Rule isDouble({String message}) {
    return RuleJtype((v) {
      if (v is JString) {
        if (!_isEmpitJType(v)) {
          var e = double.tryParse(v.value.replaceAll(".", ","));
          if (e != null) {
            return true;
          }
        }
        return false;
      }
      return true;
    }, exceptionBuilder: (v) {
      return IsDoubleRuleExcpetion(message != null
          ? message
          : "${v.keyname} is not valid double (${v.value})");
    });
  }

  ///This rule works with the following types: `JString`
  static Rule isDateTime({String message}) {
    return RuleJtype((v) {
      if (v is JString && !_isEmpitJType(v)) {
        var d = DateTime.tryParse(v.value);
        if (d != null) {
          return false;
        }
        return true;
      }
      return true;
    }, exceptionBuilder: (v) {
      return IsDateTimeRuleExcpetion(message != null
          ? message
          : " ${v.keyname} is not valid DateTime (${v.value})");
    });
  }

  ///This rule works with the following types: `JString`
  static Rule regex(RegExp regex, {String message}) {
    return RuleJtype((v) {
      if (v is JString) {
        var m = regex.allMatches(v.value);
        if (m.length == 0) {
          return false;
        }
        return true;
      }
      return true;
    }, exceptionBuilder: (v) {
      return RegexRuleExcpetion(message != null ? message : "");
    });
  }

  /// Build your layout, if you return `false` no error will be triggered,
  /// if you return `true` it will trigger the error
  static Rule customRule(
    bool Function(JType) test,
    RuleException Function(JType) exception,
  ) {
    return RuleJtype(test, exceptionBuilder: exception);
  }
}
