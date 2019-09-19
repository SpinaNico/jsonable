abstract class JsonSchema<E, JsonType> implements Map<E, JsonType> {
  static JsonSchema<E, JsonType> newScheme<E, JsonType>(
      Map<E, JsonType> values) {
    return _CJsonSchema<E, JsonType>(values);
  }
}

class _CJsonSchema<E, JsonType> implements JsonSchema<E, JsonType> {
  Map<E, JsonType> _elements = {};
  _CJsonSchema([Map<E, JsonType> value]) {
    if (value != null) this._elements = value;
  }
  JsonSchema get value => this;
  set value(JsonSchema value) => throw "You can't set a json Schema";

// proxy map
  @override
  JsonType operator [](Object key) => this._elements[key];

  void operator []=(E key, JsonType value) {
    this._elements[key] = value;
  }

  @override
  void addAll(Map<E, JsonType> other) {
    this._elements.addAll(other);
  }

  @override
  void addEntries(Iterable<MapEntry<E, JsonType>> newEntries) {
    this._elements.addEntries(newEntries);
  }

  @override
  Map<RK, RV> cast<RK, RV>() {
    return this._elements.cast<RK, RV>();
  }

  @override
  void clear() {
    this._elements.clear();
  }

  @override
  bool containsKey(Object key) {
    return this._elements.containsKey(key);
  }

  @override
  bool containsValue(Object value) {
    return this._elements.containsValue(value);
  }

  @override
  Iterable<MapEntry<E, JsonType>> get entries => this._elements.entries;

  @override
  void forEach(void Function(E key, JsonType value) f) {
    this._elements.forEach(f);
  }

  @override
  bool get isEmpty => this._elements.isEmpty;

  @override
  bool get isNotEmpty => this._elements.isNotEmpty;

  @override
  Iterable<E> get keys => this._elements.keys;

  @override
  int get length => this._elements.length;

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(E key, JsonType value) f) {
    return this._elements.map<K2, V2>(f);
  }

  @override
  JsonType putIfAbsent(E key, JsonType Function() ifAbsent) {
    return this._elements.putIfAbsent(key, ifAbsent);
  }

  @override
  JsonType remove(Object key) {
    return this._elements.remove(key);
  }

  @override
  void removeWhere(bool Function(E key, JsonType value) predicate) {
    this._elements.removeWhere(predicate);
  }

  @override
  JsonType update(E key, JsonType Function(JsonType value) update,
      {JsonType Function() ifAbsent}) {
    return this._elements.update(
          key,
          update,
          ifAbsent: ifAbsent,
        );
  }

  @override
  void updateAll(JsonType Function(E key, JsonType value) update) {
    this._elements.updateAll(update);
  }

  @override
  Iterable<JsonType> get values => this._elements.values;
}
