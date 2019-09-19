import "package:jsonable/jsonable.dart";

class MyClass with Jsonable {
  JMap myMap;
  MyClass() {
    myMap = jMap("map");
  }
}
