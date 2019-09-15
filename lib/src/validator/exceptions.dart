class JsonableException implements Exception {
  String message;
  JsonableException({this.message});
}

// class JsonableVariableException extends JsonableException {
//   JsonableVariableException({String message}) : super(message: message);
// }

// class JsonableGetterException extends JsonableException {
//   JsonableGetterException({String message}) : super(message: message);
// }
