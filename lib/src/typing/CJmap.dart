import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/errors.dart';
import 'package:jsonable/src/validator/rules.dart';

class CJmap<E, R> extends JMap<E?, R?> {
  dynamic _builder;
  CJmap(Jsonable parent, keyname,
      {Map? initialValue, JsonableBuilder? builder, List<Rule>? rules = const []})
      : super(keyname, parent, initialValue: initialValue, rules: rules) {
    _builder = builder;
  }

  Map<E?, R?>? get _elements => value as Map<E?, R?>?;
  void operator []=(E? key, R? value) {
    _elements![key] = value;
  }

  createElements(Map<dynamic, dynamic> values) {
    if (_builder == null) throw noConstructorError;
    value = values.map<E, R?>((key, val) {
      return MapEntry(key, _builder()..fromMap(val));
    });
  }

  @override
  void addAll(Map<E?, R?> other) {
    _elements!.addAll(other);
  }

  @override
  void addEntries(Iterable<MapEntry<E?, R?>> newEntries) {
    _elements!.addEntries(newEntries);
  }

  @override
  Map<RK, RV> cast<RK, RV>() {
    return _elements!.cast<RK, RV>();
  }

  @override
  void clear() {
    _elements!.clear();
  }

  @override
  bool containsKey(Object? key) {
    return _elements!.containsKey(key);
  }

  @override
  bool containsValue(Object? value) {
    return _elements!.containsValue(value);
  }

  @override
  Iterable<MapEntry<E?, R?>> get entries => _elements!.entries;

  @override
  void forEach(void Function(E? key, R? value) f) {
    _elements!.forEach(f);
  }

  @override
  bool get isEmpty => _elements!.isEmpty;

  @override
  bool get isNotEmpty => _elements!.isNotEmpty;

  @override
  Iterable<E?> get keys => _elements!.keys;

  @override
  int get length => _elements!.length;

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(E? key, R? value) f) {
    return _elements!.map<K2, V2>(f);
  }

  @override
  R? putIfAbsent(E? key, R? Function() ifAbsent) {
    return _elements!.putIfAbsent(key, ifAbsent);
  }

  @override
  R? remove(Object? key) {
    return _elements!.remove(key);
  }

  @override
  void removeWhere(bool Function(E? key, R? value) predicate) {
    _elements!.removeWhere(predicate);
  }

  @override
  R? update(E? key, R? Function(R? value) update, {R? Function()? ifAbsent}) {
    return _elements!.update(
      key,
      update,
      ifAbsent: ifAbsent,
    );
  }

  @override
  void updateAll(R? Function(E? key, R? value) update) {
    _elements!.updateAll(update);
  }

  @override
  Iterable<R?> get values => _elements!.values;

  @override
  R? operator [](Object? key) => _elements![key as E];
}
