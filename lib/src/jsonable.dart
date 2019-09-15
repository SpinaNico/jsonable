import "dart:convert";
import "./mapable.dart";

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
String jsonable(Object o) {
  return jsonEncode(
    mapable(o),
  );
}
