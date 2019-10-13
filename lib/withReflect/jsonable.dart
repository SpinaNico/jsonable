import "dart:convert";
import "./mapable.dart";

@deprecated
mixin mixinJson {
  String toJson() {
    return jsonable(this);
  }

  fromJson(String json) {
    dynamic c = jsonDecode(json);
    rawfromMap(this, c);
  }
}

///This function receives an object and returns the json string of its fields
@deprecated
String jsonable(Object o) {
  return jsonEncode(mapable(o));
}

@deprecated
List<E> jsonableList<E>(String json) {
  throw "Not implemented";
}
