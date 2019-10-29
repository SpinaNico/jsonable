abstract class JsonableException implements Exception {
  String message;
  JsonableException(this.message);
}

class MinRuleException extends JsonableException {
  MinRuleException(String message) : super(message);
}

class MaxRuleExcpetion extends JsonableException {
  MaxRuleExcpetion(String message) : super(message);
}

class LenRuleExcpetion extends JsonableException {
  LenRuleExcpetion(String message) : super(message);
}

class EqualRuleExcpetion extends JsonableException {
  EqualRuleExcpetion(String message) : super(message);
}

class OneOfRuleExcpetion extends JsonableException {
  OneOfRuleExcpetion(String message) : super(message);
}

class RequiredRuleExcpetion extends JsonableException {
  RequiredRuleExcpetion(String message) : super(message);
}

class RequiredWithRuleExcpetion extends JsonableException {
  RequiredWithRuleExcpetion(String message) : super(message);
}

class RequiredWithoutRuleExcpetion extends JsonableException {
  RequiredWithoutRuleExcpetion(String message) : super(message);
}

class NotEqualRuleExcpetion extends JsonableException {
  NotEqualRuleExcpetion(String message) : super(message);
}

class GteRuleExcpetion extends JsonableException {
  GteRuleExcpetion(String message) : super(message);
}

class LteRuleExcpetion extends JsonableException {
  LteRuleExcpetion(String message) : super(message);
}

class LtRuleExcpetion extends JsonableException {
  LtRuleExcpetion(String message) : super(message);
}

class GtRuleExcpetion extends JsonableException {
  GtRuleExcpetion(String message) : super(message);
}

class IsEmailRuleExcpetion extends JsonableException {
  IsEmailRuleExcpetion(String message) : super(message);
}

class IsNumberRuleExcpetion extends JsonableException {
  IsNumberRuleExcpetion(String message) : super(message);
}

class IsIntRuleExcpetion extends JsonableException {
  IsIntRuleExcpetion(String message) : super(message);
}

class IsDoubleRuleExcpetion extends JsonableException {
  IsDoubleRuleExcpetion(String message) : super(message);
}

class IsDateRuleExcpetion extends JsonableException {
  IsDateRuleExcpetion(String message) : super(message);
}

class IsDateTimeRuleExcpetion extends JsonableException {
  IsDateTimeRuleExcpetion(String message) : super(message);
}

class IsURLRuleExcpetion extends JsonableException {
  IsURLRuleExcpetion(String message) : super(message);
}

class RegexRuleExcpetion extends JsonableException {
  RegexRuleExcpetion(String message) : super(message);
}
