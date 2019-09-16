import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/scheme/JsonSchema.dart';

class MapList<E> {
  dynamic value;
  MapList(dynamic v) {
    if (v is List) {
      this.value = new List();
    } else if (v is Map) {
      this.value = new Map();
    }
  }

  add(JsonEntry element) {
    if (element.keyname == null) {
      value.add(element.value.value);
    } else {
      value.addEntries([MapEntry(element.keyname, element.value.value)]);
    }
  }
}
