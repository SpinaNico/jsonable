import 'dart:math';

import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/errors.dart';
import 'package:jsonable/src/validator/rules.dart';

Iterable<List<T>> zip<T>(List<Iterable> iterables) sync* {
  if (iterables.isEmpty) return;
  final iterators = iterables.map((e) => e.iterator).toList(growable: false);
  while (iterators.every((e) => e.moveNext())) {
    yield iterators.map((e) => e.current).toList(growable: false);
  }
}

class CJlist<E> extends JList<E> {
  dynamic _builder;
  List<E> get _elements => value;

  void createElements(List values) {
    if (_builder == null) throw noConstructorError;
    var index = 0;
    values.where((v) => v is Map ? true : false).forEach((val) {
      if (index < length) {
        (this[index] as Jsonable).fromMap(val);
      } else {
        add(_builder()..fromMap(val));
      }
      index++;
    });
  }

  CJlist(Jsonable parent, keyname,
      {List<E> initialValue,
      JsonableBuilder builder,
      List<Rule> rules = const []})
      : super(keyname, parent, initialValue: initialValue, rules: rules) {
    if (initialValue == null) {
      value = <E>[];
    }
    _builder = builder;
  }

  bool operator ==(Object other) {
    if (other is JList) {
      if (other.length != length) return false;
      for (var el in zip([this, other])) {
        if (el[0] != el[1]) return false;
      }
      return true;
    }
    if (other is List) {
      if (other.length != length) return false;
      for (var el in zip([this, other])) {
        if (el[0] != el[1]) return false;
      }
      return true;
    }

    return this == other;
  }

  /// List proxy
  @override
  bool any(bool Function(E element) test) {
    for (var element in _elements) {
      if (test(element)) return true;
    }
    return false;
  }

  bool contains(dynamic element) => _elements.contains(element);

  elementAt(int index) => _elements.elementAt(index);
  bool every(bool Function(E element) test) => _elements.every(test);
  Iterable<T> expand<T>(Iterable<T> Function(E element) f) =>
      _elements.expand(f);

  E get first => _elements.first;

  E firstWhere(bool Function(E element) test, {Function() orElse}) =>
      _elements.firstWhere(test, orElse: orElse);

  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) =>
      _elements.fold(initialValue, combine);

  Iterable<E> followedBy(Iterable other) => followedBy(other);
  void forEach(void Function(E element) f) => _elements.forEach(f);

  bool get isEmpty => _elements.isEmpty;

  bool get isNotEmpty => _elements.isNotEmpty;

  Iterator<E> get iterator => _elements.iterator;

  String join([String separator = ""]) => _elements.join(separator);

  E get last => _elements.last;
  lastWhere(bool Function(E element) test, {Function() orElse}) =>
      _elements.lastWhere(test, orElse: orElse);

  int get length => _elements.length;
  Iterable<T> map<T>(T Function(E e) f) {
    return _elements.map<T>(f);
  }

  @override
  E reduce(Function(E value, E element) combine) => _elements.reduce(combine);
  E get single => _elements.single;
  E singleWhere(bool Function(E element) test, {Function() orElse}) =>
      _elements.singleWhere(test, orElse: orElse);

  @override
  Iterable<E> skip(int count) => _elements.skip(count);

  Iterable<E> skipWhile(bool Function(E value) test) =>
      _elements.skipWhile(test);

  Iterable<E> take(int count) => _elements.take(count);

  Iterable<E> takeWhile(bool Function(E value) test) =>
      _elements.takeWhile(test);

  List<E> toList({bool growable = true}) => _elements.toList();

  Set<E> toSet() => _elements.toSet();

  Iterable<E> where(bool Function(E element) test) => _elements.where(test);

  @override
  Iterable<T> whereType<T>() => _elements.whereType();

  @override
  List<E> operator +(Object other) {
    if (other is List<E> || other is JList<E>) {
      return List.from(_elements) + List.from(other);
    }
    return _elements + other;
  }

  @override
  E operator [](int index) => value[index];

  @override
  void operator []=(int index, E value) => this.value[index] = value;

  @override
  void add(E value) => this.value.add(value);
  @override
  void addAll(Iterable<E> iterable) => value.addAll(iterable);

  @override
  Map<int, E> asMap() => _elements.asMap();

  @override
  List<R> cast<R>() => _elements.cast<R>();

  @override
  void clear() => _elements.clear();
  @override
  void fillRange(int start, int end, [E fillValue]) =>
      _elements.fillRange(start, end);

  @override
  set first(E value) {
    _elements.first = value;
  }

  @override
  Iterable<E> getRange(int start, int end) => _elements.getRange(start, end);

  @override
  int indexOf(E element, [int start = 0]) => _elements.indexOf(element, start);

  @override
  int indexWhere(bool Function(E element) test, [int start = 0]) =>
      _elements.indexWhere(test, start);

  @override
  void insert(int index, E element) => _elements.insert(index, element);

  @override
  void insertAll(int index, Iterable<E> iterable) =>
      _elements.insertAll(index, iterable);

  @override
  set last(E value) {
    _elements.last = value;
  }

  @override
  int lastIndexOf(E element, [int start]) =>
      _elements.lastIndexOf(element, start);

  @override
  int lastIndexWhere(bool Function(E element) test, [int start]) =>
      _elements.lastIndexWhere(test, start);

  @override
  set length(int newLength) {
    _elements.length = newLength;
  }

  @override
  bool remove(Object value) => _elements.remove(value);

  @override
  E removeAt(int index) => _elements.removeAt(index);

  @override
  E removeLast() => _elements.removeLast();

  @override
  void removeRange(int start, int end) => _elements.removeRange(start, end);

  @override
  void removeWhere(bool Function(E element) test) =>
      _elements.removeWhere(test);

  @override
  void replaceRange(int start, int end, Iterable<E> replacement) =>
      _elements.replaceRange(start, end, replacement);

  @override
  void retainWhere(bool Function(E element) test) =>
      _elements.retainWhere(test);

  Iterable<E> get reversed => _elements.reversed;

  @override
  void setAll(int index, Iterable<E> iterable) =>
      _elements.setAll(index, iterable);

  @override
  void setRange(int start, int end, Iterable<E> iterable,
          [int skipCount = 0]) =>
      _elements.setRange(start, end, iterable);

  @override
  void shuffle([Random random]) => _elements.shuffle(random);

  @override
  void sort([int Function(E a, E b) compare]) => _elements.sort(compare);

  @override
  List<E> sublist(int start, [int end]) => _elements.sublist(start, end);
}
