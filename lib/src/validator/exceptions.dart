import 'package:jsonable/jsonable.dart';

enum JsonableError { length, min, max, required, nullable }

class JsonableException implements Exception {
  String message;
  JsonableException({this.message});
  @override
  String toString() => this.message;
}

class JsonableReportError extends JsonableMapable {
  JsonableReportError();
  List<JsonableException> errors = [];
  bool error = false;

  toString() {
    return this.toJson();
  }
}
