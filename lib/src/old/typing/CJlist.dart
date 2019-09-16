import 'dart:math';

import "package:jsonable/jsonable.dart";

class CJlist<E> extends Jlist<E> {
  List<E> get _elements => this.value;
  CJlist({List<E> initialValue, JsonableConstructor constructor})
      : super(initialValue: initialValue) {
    this._constructor = constructor;
  }
  JsonableConstructor _constructor;
  JsonableConstructor get constructor {
    return this._constructor;
  }

  /// List proxy
  @override
  bool any(bool Function(E element) test) {
    for (var element in this._elements) {
      if (test(element)) return true;
    }
    return false;
  }

  @override
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
    // TODO: implement +
    return null;
  }

  @override
  E operator [](int index) {
    // TODO: implement []
    return null;
  }

  @override
  void operator []=(int index, E value) {
    // TODO: implement []=
  }

  @override
  void add(E value) {
    // TODO: implement add
  }

  @override
  void addAll(Iterable<E> iterable) {
    // TODO: implement addAll
  }

  @override
  Map<int, E> asMap() {
    // TODO: implement asMap
    return null;
  }

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  void fillRange(int start, int end, [E fillValue]) {
    // TODO: implement fillRange
  }

  @override
  void set first(E value) {
    // TODO: implement first
  }

  @override
  Iterable<E> getRange(int start, int end) {
    // TODO: implement getRange
    return null;
  }

  @override
  int indexOf(E element, [int start = 0]) {
    // TODO: implement indexOf
    return null;
  }

  @override
  int indexWhere(bool Function(E element) test, [int start = 0]) {
    // TODO: implement indexWhere
    return null;
  }

  @override
  void insert(int index, E element) {
    // TODO: implement insert
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    // TODO: implement insertAll
  }

  @override
  void set last(E value) {
    // TODO: implement last
  }

  @override
  int lastIndexOf(E element, [int start]) {
    // TODO: implement lastIndexOf
    return null;
  }

  @override
  int lastIndexWhere(bool Function(E element) test, [int start]) {
    // TODO: implement lastIndexWhere
    return null;
  }

  @override
  void set length(int newLength) {
    // TODO: implement length
  }

  @override
  bool remove(Object value) {
    // TODO: implement remove
    return null;
  }

  @override
  E removeAt(int index) {
    // TODO: implement removeAt
    return null;
  }

  @override
  E removeLast() {
    // TODO: implement removeLast
    return null;
  }

  @override
  void removeRange(int start, int end) {
    // TODO: implement removeRange
  }

  @override
  void removeWhere(bool Function(E element) test) {
    // TODO: implement removeWhere
  }

  @override
  void replaceRange(int start, int end, Iterable<E> replacement) {
    // TODO: implement replaceRange
  }

  @override
  void retainWhere(bool Function(E element) test) {
    // TODO: implement retainWhere
  }

  @override
  // TODO: implement reversed
  Iterable<E> get reversed => null;

  @override
  void setAll(int index, Iterable<E> iterable) {
    // TODO: implement setAll
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    // TODO: implement setRange
  }

  @override
  void shuffle([Random random]) {
    // TODO: implement shuffle
  }

  @override
  void sort([int Function(E a, E b) compare]) {
    // TODO: implement sort
  }

  @override
  List<E> sublist(int start, [int end]) {
    // TODO: implement sublist
    return null;
  }

  @override
  List<R> cast<R>() {
    // TODO: implement cast
    return null;
  }
}
