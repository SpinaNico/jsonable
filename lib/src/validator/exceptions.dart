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
