import "package:jsonable/jsonable.dart";

class MyClass with Jsonable {
  late JMap myMap;
  MyClass() {
    myMap = jMap("map");
  }
}
