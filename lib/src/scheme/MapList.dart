///This is a class that allows me to manage lists and maps as
///if they were a single object with a single add method,
///so that the upper level does not know if it is endodando a list or a map
class MapList<E> {
  dynamic value;
  MapList(dynamic v) {
    if (v is List) {
      this.value = new List();
    } else if (v is Map) {
      this.value = new Map();
    }
  }

  add(key, val) {
    if (key == null) {
      value.add(val);
    } else {
      value.addEntries([MapEntry(key, val)]);
    }
  }
}
