import "package:jsonable/jsonable.dart" show Jobject, JsonableConstructor;
import 'package:jsonable/jsonable.dart';

class CJobject extends Jobject {
  CJobject(JsonableConstructor initialValue)
      : super(initialValue: initialValue()) {}
}
