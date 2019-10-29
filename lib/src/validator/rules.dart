import 'package:jsonable/jsonable.dart';
import "./exceptions.dart";

abstract class Rule<E> {
  bool Function(E) function;
  Rule(this.function);
  RuleException Function(E) exceptionBuilder;
  bool test(E value) {
    return this.function(value);
  }
}

bool _isEmpitJType(JType value) {
  if (value == null) return true;
  if (value.get == null || (value is JString && value.get == "")) return true;
  return false;
}

class RuleJtype implements Rule<JType> {
  @override
  bool Function(JType) function;

  RuleException Function(JType) exceptionBuilder;

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
  RuleException Function(Jsonable) exceptionBuilder;
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

  static Rule len(int len, {String message}) {
    return RuleJtype((v) {
      if (v.get != null) {
        if (v is JString || v is JList) return v.get.length == len;
      }
      return true;
    });
  }

  static Rule equal(dynamic value, {String message}) {
    return RuleJtype((v) {
      if (v.get != null) {
        if (v is JString && value is String) return v.get == value;
        if (v is JNum && value is num) return v.get == value;
        if (v is JNum && value is int) return v.get == value;
        if (v is JNum && value is double) return v.get == value;
        if (v is JList && value is List) return v.get == value;
      }

      return true;
    });
  }

  static Rule oneOf(List elements, {String message}) {
    return RuleJtype((v) {
      for (var e in elements) {
        if (e == v.get) {
          return true;
        }
      }
      return false;
    });
  }

  ///Check that a field is not null, reporting the error with validate
  static Rule required({String message}) {
    return RuleJtype((v) {
      return _isEmpitJType(v);
    }, exceptionBuilder: (v) {
      return RequiredRuleExcpetion(
          message != null ? message : "${v.keyname} is required");
    });
  }

  ///This field will be checked, if it is not null or empty.
  /// if it is not null / void all the fields indicated in
  /// fields that are not empty / void will be checked
  /// if it fails return in validate method; RequiredWithRuleExcpetion
  static Rule requiredWith(List<String> fields, {String message}) {
    return RuleJtype(
      (v) {
        if (_isEmpitJType(v) == false)
          return fields
              .map<bool>((element) {
                if (_isEmpitJType(v.parent[element]))
                  return true;
                else
                  return false;
              })
              .toList()
              .every((ele) => ele == false);
        return true;
      },
      exceptionBuilder: (v) {
        var f = fields.join(", ");
        return RequiredWithRuleExcpetion(message != null
            ? message
            : "${v.keyname} requires with fields: $f");
      },
    );
  }

  static Rule requiredWithout(List<String> fields, {String message}) {
    return RuleJtype((v) {
      var q = fields
          .map<bool>((element) {
            if (_isEmpitJType(v)) return false;

            return true;
          })
          .toList()
          .every((ele) => ele == false);

      if (q == true) {
        if (_isEmpitJType(v)) return true;
        return false;
      }
      return true;
    }, exceptionBuilder: (v) {
      var f = fields.join(", ");
      return RequiredWithoutRuleExcpetion(message != null
          ? message
          : "${v.keyname} required without fields: $f");
    });
  }

  static Rule notEqual(dynamic value, {String message}) {
    return RuleJtype((v) {
      if (v is JNum && (value is int || value is double || value is num))
        return v.get != value;

      if (v is JString && value is String) return v != value;

      return true;
    }, exceptionBuilder: (v) {
      return NotEqualRuleExcpetion(
          message != null ? message : "${v.keyname} != $value");
    });
  }

  static Rule gte(num value, {String message}) {
    return RuleJtype((v) {
      if (v is JNum && (value is int || value is double || value is num))
        return v.get >= value;
      return true;
    }, exceptionBuilder: (v) {
      return GteRuleExcpetion(
          message != null ? message : "${v.keyname} <= $value");
    });
  }

  static Rule lte(num value, {String message}) {
    return RuleJtype((v) {
      if (v is JNum && (value is int || value is double || value is num))
        return v.get <= value;
      return true;
    }, exceptionBuilder: (v) {
      return LteRuleExcpetion(
          message != null ? message : "${v.keyname} <= $value");
    });
  }

  static Rule lt(num value, {String message}) {
    return RuleJtype((v) {
      if (v is JNum && (value is int || value is double || value is num))
        return v.get < value;
      return true;
    }, exceptionBuilder: (v) {
      return LtRuleExcpetion(
          message != null ? message : "${v.keyname} < $value");
    });
  }

  static Rule gt(num value, {String message}) {
    return RuleJtype((v) {
      if (v is JNum && (value is int || value is double || value is num))
        return v.get > value;
      return true;
    }, exceptionBuilder: (v) {
      return GtRuleExcpetion(
          message != null ? message : "${v.keyname} > $value");
    });
  }

  static Rule isEmail({String message}) {
    return RuleJtype((v) {
      return true;
    }, exceptionBuilder: (v) {
      return RuleException(message != null ? message : "");
    });
  }

  static Rule isNumber({String message}) {
    return RuleJtype((v) {
      if (v is JString) {
        if (!_isEmpitJType(v)) {
          var e = num.tryParse(v.get);
          if (e != null) {
            return true;
          }
        }
        return false;
      }
      return true;
    }, exceptionBuilder: (v) {
      return IsNumberRuleExcpetion(message != null ? message : "");
    });
  }

  static Rule isInt({String message}) {
    return RuleJtype((v) {
      if (v is JString) {
        if (!_isEmpitJType(v)) {
          var e = int.tryParse(v.get);
          if (e != null) {
            return true;
          }
        }
        return false;
      }
      return true;
    }, exceptionBuilder: (v) {
      return IsIntRuleExcpetion(message != null ? message : "");
    });
  }

  static Rule isDouble({String message}) {
    return RuleJtype((v) {
      if (v is JString) {
        if (!_isEmpitJType(v)) {
          var e = double.tryParse(v.get);
          if (e != null) {
            return true;
          }
        }
        return false;
      }
      return true;
    }, exceptionBuilder: (v) {
      return IsDoubleRuleExcpetion(message != null ? message : "");
    });
  }

  static Rule isDate({String message}) {
    return RuleJtype((v) {
      if (v is JString && !_isEmpitJType(v)) {
        var d = DateTime.tryParse(v.get);
        if (d != null) return true;
        return false;
      }
      return true;
    }, exceptionBuilder: (v) {
      return IsDateRuleExcpetion(message != null ? message : "");
    });
  }

  static Rule isDateTime({String message}) {
    return RuleJtype((v) {
      if (v is JString && !_isEmpitJType(v)) {
        var d = DateTime.tryParse(v.get);
        if (d != null) return true;
        return false;
      }
      return true;
    }, exceptionBuilder: (v) {
      return IsDateTimeRuleExcpetion(message != null ? message : "");
    });
  }

  // static Rule isURL({String message}) {
  //   return RuleJtype((v) {
  //     return true;
  //   }, exceptionBuilder: (v) {
  //     return IsURLRuleExcpetion(message != null ? message : "");
  //   });
  // }

  static Rule regex(RegExp regex, {String message}) {
    return RuleJtype((v) {
      if (v is JString) {
        var m = regex.allMatches(v.get);
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

  /// Build your layout, if you return true no error will be triggered,
  /// if you return false it will trigger the error
  Rule customRule(
      bool Function(JType) test, RuleException Function(JType) exption) {
    return RuleJtype(test, exceptionBuilder: exption);
  }
}
