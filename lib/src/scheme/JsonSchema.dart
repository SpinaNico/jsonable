abstract class JsonSchema<E, JType> implements Map<E, JType> {
  static JsonSchema<E, JType> newScheme<E, JType>(Map<E, JType> values) {
    return _CJsonSchema<E, JType>(values);
  }
}

class _CJsonSchema<E, JType> implements JsonSchema<E, JType> {
  Map<E, JType> _elements = {};
  _CJsonSchema([Map<E, JType> value]) {
    if (value != null) _elements = value;
  }
  JsonSchema get value => this;
  set value(JsonSchema value) => throw "You can't set a json Schema";

// proxy map
  @override
  JType operator [](Object key) => _elements[key];

  void operator []=(E key, JType value) {
    _elements[key] = value;
  }

  @override
  void addAll(Map<E, JType> other) {
    _elements.addAll(other);
  }

  @override
  void addEntries(Iterable<MapEntry<E, JType>> newEntries) {
    _elements.addEntries(newEntries);
  }

  @override
  Map<RK, RV> cast<RK, RV>() {
    return _elements.cast<RK, RV>();
  }

  @override
  void clear() {
    _elements.clear();
  }

  @override
  bool containsKey(Object key) {
    return _elements.containsKey(key);
  }

  @override
  bool containsValue(Object value) {
    return _elements.containsValue(value);
  }

  @override
  Iterable<MapEntry<E, JType>> get entries => _elements.entries;

  @override
  void forEach(void Function(E key, JType value) f) {
    _elements.forEach(f);
  }

  @override
  bool get isEmpty => _elements.isEmpty;

  @override
  bool get isNotEmpty => _elements.isNotEmpty;

  @override
  Iterable<E> get keys => _elements.keys;

  @override
  int get length => _elements.length;

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(E key, JType value) f) {
    return _elements.map<K2, V2>(f);
  }

  @override
  JType putIfAbsent(E key, JType Function() ifAbsent) {
    return _elements.putIfAbsent(key, ifAbsent);
  }

  @override
  JType remove(Object key) {
    return _elements.remove(key);
  }

  @override
  void removeWhere(bool Function(E key, JType value) predicate) {
    _elements.removeWhere(predicate);
  }

  @override
  JType update(E key, JType Function(JType value) update,
      {JType Function() ifAbsent}) {
    return _elements.update(
      key,
      update,
      ifAbsent: ifAbsent,
    );
  }

  @override
  void updateAll(JType Function(E key, JType value) update) {
    _elements.updateAll(update);
  }

  @override
  Iterable<JType> get values => _elements.values;
}
