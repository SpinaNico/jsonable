abstract class JsonableValidatorException implements Exception {
  final String message;
  JsonableValidatorException({this.message});
  @override
  String toString() {
    // TODO: implement toString
    return this.message;
  }
}

class JsonableLenError extends JsonableValidatorException implements Exception {
  JsonableLenError(String message) : super(message: message);
}

class JsonableMinError {}

class JsonableMaxError {}

class JsonableOneOfError {}

class JsonableRegexError {}

/*
RegExp regex,
    dynamic notEgual,
    dynamic egual,
    bool required,
    List<String> requiredWidth,
    List<String> requiredWithout,
    String badCharacter,
*/
