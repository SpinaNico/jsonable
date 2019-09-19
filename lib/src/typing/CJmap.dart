import 'package:jsonable/jsonable.dart';

class CJmap<E, R> extends Jmap<E, R> {
  CJmap({Map initialValue}) : super(initialValue: initialValue) {}
  Map<E, R> get _elements => this.value;
  void operator []=(E key, R value) {
    this._elements[key] = value;
  }

  @override
  void addAll(Map<E, R> other) {
    this._elements.addAll(other);
  }

  @override
  void addEntries(Iterable<MapEntry<E, R>> newEntries) {
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
  Iterable<MapEntry<E, R>> get entries => this._elements.entries;

  @override
  void forEach(void Function(E key, R value) f) {
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
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(E key, R value) f) {
    return this._elements.map<K2, V2>(f);
  }

  @override
  R putIfAbsent(E key, R Function() ifAbsent) {
    return this._elements.putIfAbsent(key, ifAbsent);
  }

  @override
  R remove(Object key) {
    return this._elements.remove(key);
  }

  @override
  void removeWhere(bool Function(E key, R value) predicate) {
    this._elements.removeWhere(predicate);
  }

  @override
  R update(E key, R Function(R value) update, {R Function() ifAbsent}) {
    return this._elements.update(
          key,
          update,
          ifAbsent: ifAbsent,
        );
  }

  @override
  void updateAll(R Function(E key, R value) update) {
    this._elements.updateAll(update);
  }

  @override
  Iterable<R> get values => this._elements.values;

  @override
  R operator [](Object key) => this._elements[key];
}
