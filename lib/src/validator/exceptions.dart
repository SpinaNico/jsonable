class RuleException implements Exception {
  String message;
  RuleException(this.message);
  @override
  String toString() {
    return this.message.toString();
  }
}

class MinRuleException extends RuleException {
  MinRuleException(String message) : super(message);
}

class MaxRuleExcpetion extends RuleException {
  MaxRuleExcpetion(String message) : super(message);
}

class LenRuleExcpetion extends RuleException {
  LenRuleExcpetion(String message) : super(message);
}

class EqualRuleExcpetion extends RuleException {
  EqualRuleExcpetion(String message) : super(message);
}

class OneOfRuleExcpetion extends RuleException {
  OneOfRuleExcpetion(String message) : super(message);
}

class RequiredRuleExcpetion extends RuleException {
  RequiredRuleExcpetion(String message) : super(message);
}

class RequiredWithRuleExcpetion extends RuleException {
  RequiredWithRuleExcpetion(String message) : super(message);
}

class RequiredWithoutRuleExcpetion extends RuleException {
  RequiredWithoutRuleExcpetion(String message) : super(message);
}

class NotEqualRuleExcpetion extends RuleException {
  NotEqualRuleExcpetion(String message) : super(message);
}

class GteRuleExcpetion extends RuleException {
  GteRuleExcpetion(String message) : super(message);
}

class LteRuleExcpetion extends RuleException {
  LteRuleExcpetion(String message) : super(message);
}

class LtRuleExcpetion extends RuleException {
  LtRuleExcpetion(String message) : super(message);
}

class GtRuleExcpetion extends RuleException {
  GtRuleExcpetion(String message) : super(message);
}

class IsEmailRuleExcpetion extends RuleException {
  IsEmailRuleExcpetion(String message) : super(message);
}

class IsNumberRuleExcpetion extends RuleException {
  IsNumberRuleExcpetion(String message) : super(message);
}

class IsIntRuleExcpetion extends RuleException {
  IsIntRuleExcpetion(String message) : super(message);
}

class IsDoubleRuleExcpetion extends RuleException {
  IsDoubleRuleExcpetion(String message) : super(message);
}

class IsDateRuleExcpetion extends RuleException {
  IsDateRuleExcpetion(String message) : super(message);
}

class IsDateTimeRuleExcpetion extends RuleException {
  IsDateTimeRuleExcpetion(String message) : super(message);
}

class IsURLRuleExcpetion extends RuleException {
  IsURLRuleExcpetion(String message) : super(message);
}

class RegexRuleExcpetion extends RuleException {
  RegexRuleExcpetion(String message) : super(message);
}
