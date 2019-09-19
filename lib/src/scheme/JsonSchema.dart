abstract class JsonSchema<E, JType> implements Map<E, JType> {
  static JsonSchema<E, JType> newScheme<E, JType>(Map<E, JType> values) {
    return _CJsonSchema<E, JType>(values);
  }
}

class _CJsonSchema<E, JType> implements JsonSchema<E, JType> {
  Map<E, JType> _elements = {};
  _CJsonSchema([Map<E, JType> value]) {
    if (value != null) this._elements = value;
  }
  JsonSchema get value => this;
  set value(JsonSchema value) => throw "You can't set a json Schema";

// proxy map
  @override
  JType operator [](Object key) => this._elements[key];

  void operator []=(E key, JType value) {
    this._elements[key] = value;
  }

  @override
  void addAll(Map<E, JType> other) {
    this._elements.addAll(other);
  }

  @override
  void addEntries(Iterable<MapEntry<E, JType>> newEntries) {
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
  Iterable<MapEntry<E, JType>> get entries => this._elements.entries;

  @override
  void forEach(void Function(E key, JType value) f) {
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
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(E key, JType value) f) {
    return this._elements.map<K2, V2>(f);
  }

  @override
  JType putIfAbsent(E key, JType Function() ifAbsent) {
    return this._elements.putIfAbsent(key, ifAbsent);
  }

  @override
  JType remove(Object key) {
    return this._elements.remove(key);
  }

  @override
  void removeWhere(bool Function(E key, JType value) predicate) {
    this._elements.removeWhere(predicate);
  }

  @override
  JType update(E key, JType Function(JType value) update,
      {JType Function() ifAbsent}) {
    return this._elements.update(
          key,
          update,
          ifAbsent: ifAbsent,
        );
  }

  @override
  void updateAll(JType Function(E key, JType value) update) {
    this._elements.updateAll(update);
  }

  @override
  Iterable<JType> get values => this._elements.values;
}
