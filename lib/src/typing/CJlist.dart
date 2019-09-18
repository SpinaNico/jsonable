import 'dart:math';

import "package:jsonable/jsonable.dart";
import 'package:jsonable/src/errors.dart';

class CJlist<E> extends Jlist<E> {
  E Function() get constructor => this._constructor;
  E Function() _constructor;
  List<E> get _elements => this.value;

  createElements(List values) {
    if (constructor == null) throw noConstructorError;
    values.forEach((value) {
      if (value is Map) {
        dynamic _instance = constructor();
        _instance.fromMap(value);
        this._elements.add(_instance);
      }
    });
  }

  CJlist({List<E> initialValue, E Function() constructor})
      : super(initialValue: initialValue) {
    if (initialValue == null) {
      this.value = <E>[];
    }
    this._constructor = constructor;
  }

  /// List proxy
  @override
  bool any(bool Function(E element) test) {
    for (var element in this._elements) {
      if (test(element)) return true;
    }
    return false;
  }

  bool contains(dynamic element) => this._elements.contains(element);

  elementAt(int index) => this._elements.elementAt(index);
  bool every(bool Function(E element) test) => this._elements.every(test);
  Iterable<T> expand<T>(Iterable<T> Function(E element) f) =>
      this._elements.expand(f);

  E get first => this._elements.first;
  E firstWhere(bool Function(E element) test, {Function() orElse}) =>
      this._elements.firstWhere(test, orElse: orElse);
  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) =>
      this._elements.fold(initialValue, combine);
  Iterable<E> followedBy(Iterable other) => this.followedBy(other);
  void forEach(void Function(E element) f) => this._elements.forEach(f);
  bool get isEmpty => this._elements.isEmpty;
  bool get isNotEmpty => this._elements.isNotEmpty;
  Iterator<E> get iterator => this._elements.iterator;
  String join([String separator = ""]) => this._elements.join(separator);
  E get last => this._elements.last;
  lastWhere(bool Function(E element) test, {Function() orElse}) =>
      this._elements.lastWhere(test, orElse: orElse);

  int get length => this._elements.length;
  Iterable<T> map<T>(T Function(E e) f) => this._elements.map(f);

  @override
  reduce(Function(E value, E element) combine) =>
      this._elements.reduce(combine);
  E get single => this._elements.single;
  E singleWhere(bool Function(E element) test, {Function() orElse}) =>
      this._elements.singleWhere(test, orElse: orElse);

  @override
  Iterable<E> skip(int count) => this._elements.skip(count);

  Iterable<E> skipWhile(bool Function(E value) test) =>
      this._elements.skipWhile(test);

  Iterable<E> take(int count) => this._elements.take(count);

  Iterable<E> takeWhile(bool Function(E value) test) =>
      this._elements.takeWhile(test);

  List<E> toList({bool growable = true}) => this._elements.toList();

  Set<E> toSet() => this._elements.toSet();

  Iterable<E> where(bool Function(E element) test) =>
      this._elements.where(test);

  @override
  Iterable<T> whereType<T>() => this._elements.whereType();

  @override
  List<E> operator +(List<E> other) {
    this._elements + other;
    return this._elements;
  }

  @override
  E operator [](int index) => this.value[index];

  @override
  void operator []=(int index, E value) => this.value[index] = value;

  @override
  void add(E value) => this.value.add(value);
  @override
  void addAll(Iterable<E> iterable) => this.value.addAll(iterable);

  @override
  Map<int, E> asMap() => this._elements.asMap();

  @override
  List<R> cast<R>() => this._elements.cast<R>();

  @override
  void clear() => this._elements.clear();
  @override
  void fillRange(int start, int end, [E fillValue]) =>
      this._elements.fillRange(start, end);

  @override
  void set first(E value) => this._elements.first = value;
  @override
  Iterable<E> getRange(int start, int end) =>
      this._elements.getRange(start, end);

  @override
  int indexOf(E element, [int start = 0]) => this.indexOf(element, start);

  @override
  int indexWhere(bool Function(E element) test, [int start = 0]) =>
      this.indexWhere(test, start);

  @override
  void insert(int index, E element) => this._elements.insert(index, element);

  @override
  void insertAll(int index, Iterable<E> iterable) =>
      this._elements.insertAll(index, iterable);

  @override
  void set last(E value) => this._elements.last = value;

  @override
  int lastIndexOf(E element, [int start]) =>
      this._elements.lastIndexOf(element, start);

  @override
  int lastIndexWhere(bool Function(E element) test, [int start]) =>
      this._elements.lastIndexWhere(test, start);

  @override
  void set length(int newLength) => this._elements.length = newLength;

  @override
  bool remove(Object value) => this.remove(value);

  @override
  E removeAt(int index) => this.removeAt(index);

  @override
  E removeLast() => this._elements.removeLast();

  @override
  void removeRange(int start, int end) =>
      this._elements.removeRange(start, end);

  @override
  void removeWhere(bool Function(E element) test) =>
      this._elements.removeWhere(test);

  @override
  void replaceRange(int start, int end, Iterable<E> replacement) =>
      this._elements.replaceRange(start, end, replacement);

  @override
  void retainWhere(bool Function(E element) test) =>
      this._elements.retainWhere(test);

  Iterable<E> get reversed => this._elements.reversed;

  @override
  void setAll(int index, Iterable<E> iterable) => this.setAll(index, iterable);

  @override
  void setRange(int start, int end, Iterable<E> iterable,
          [int skipCount = 0]) =>
      this._elements.setRange(start, end, iterable);

  @override
  void shuffle([Random random]) => this._elements.shuffle(random);

  @override
  void sort([int Function(E a, E b) compare]) => this._elements.sort(compare);

  @override
  List<E> sublist(int start, [int end]) => this._elements.sublist(start, end);
}
