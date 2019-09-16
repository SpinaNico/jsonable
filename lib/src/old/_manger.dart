import "package:jsonable/jsonable.dart";

class JsonManager {
  Map<String, JsonType> elements = {};
  JsonType add(String keyName, JsonType element) {
    this.elements.addEntries([MapEntry(keyName, element)]);
    return element;
  }
}
