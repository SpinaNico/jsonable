import 'dart:math';
export "./JsonEntry.dart";
import "./JsonEntry.dart";

abstract class JsonSchema implements List<JsonEntry> {
  static JsonSchema newScheme(List<JsonEntry> values) {
    return _CJsonSchema(values);
  }
}

class _CJsonSchema implements JsonSchema {
  List<JsonEntry> _elements = [];
  _CJsonSchema([List<JsonEntry> value]) {
    if (value != null) this._elements = value;
  }
  JsonSchema get value => this;
  set value(JsonSchema value) => throw "You can't set a json Schema";

  @override
  bool any(bool Function(JsonEntry element) test) {
    for (var element in this._elements) {
      if (test(element)) return true;
    }
    return false;
  }

  bool contains(dynamic element) => this._elements.contains(element);

  elementAt(int index) => this._elements.elementAt(index);
  bool every(bool Function(JsonEntry element) test) =>
      this._elements.every(test);
  Iterable<T> expand<T>(Iterable<T> Function(JsonEntry element) f) =>
      this._elements.expand(f);

  JsonEntry get first => this._elements.first;
  JsonEntry firstWhere(bool Function(JsonEntry element) test,
          {Function() orElse}) =>
      this._elements.firstWhere(test, orElse: orElse);
  T fold<T>(T initialValue,
          T Function(T previousValue, JsonEntry element) combine) =>
      this._elements.fold(initialValue, combine);
  Iterable<JsonEntry> followedBy(Iterable other) => this.followedBy(other);
  void forEach(void Function(JsonEntry element) f) => this._elements.forEach(f);
  bool get isEmpty => this._elements.isEmpty;
  bool get isNotEmpty => this._elements.isNotEmpty;
  Iterator<JsonEntry> get iterator => this._elements.iterator;
  String join([String separator = ""]) => this._elements.join(separator);
  JsonEntry get last => this._elements.last;
  lastWhere(bool Function(JsonEntry element) test, {Function() orElse}) =>
      this._elements.lastWhere(test, orElse: orElse);

  int get length => this._elements.length;
  Iterable<T> map<T>(T Function(JsonEntry e) f) => this._elements.map(f);

  @override
  reduce(Function(JsonEntry value, JsonEntry element) combine) =>
      this._elements.reduce(combine);
  JsonEntry get single => this._elements.single;
  JsonEntry singleWhere(bool Function(JsonEntry element) test,
          {Function() orElse}) =>
      this._elements.singleWhere(test, orElse: orElse);

  @override
  Iterable<JsonEntry> skip(int count) => this._elements.skip(count);

  Iterable<JsonEntry> skipWhile(bool Function(JsonEntry value) test) =>
      this._elements.skipWhile(test);

  Iterable<JsonEntry> take(int count) => this._elements.take(count);

  Iterable<JsonEntry> takeWhile(bool Function(JsonEntry value) test) =>
      this._elements.takeWhile(test);

  List<JsonEntry> toList({bool growable = true}) => this._elements.toList();

  Set<JsonEntry> toSet() => this._elements.toSet();

  Iterable<JsonEntry> where(bool Function(JsonEntry element) test) =>
      this._elements.where(test);

  @override
  Iterable<T> whereType<T>() => this._elements.whereType();

  @override
  List<JsonEntry> operator +(List<JsonEntry> other) {
    this._elements + other;
    return this._elements;
  }

  @override
  JsonEntry operator [](int index) => this._elements[index];

  @override
  void operator []=(int index, JsonEntry value) =>
      this._elements[index] = value;

  @override
  void add(JsonEntry value) => this._elements.add(value);
  @override
  void addAll(Iterable<JsonEntry> iterable) => this._elements.addAll(iterable);

  @override
  Map<int, JsonEntry> asMap() => this._elements.asMap();

  @override
  List<R> cast<R>() => this._elements.cast<R>();

  @override
  void clear() => this._elements.clear();
  @override
  void fillRange(int start, int end, [JsonEntry fillValue]) =>
      this._elements.fillRange(start, end);

  @override
  void set first(JsonEntry value) => this._elements.first = value;
  @override
  Iterable<JsonEntry> getRange(int start, int end) =>
      this._elements.getRange(start, end);

  @override
  int indexOf(JsonEntry element, [int start = 0]) =>
      this.indexOf(element, start);

  @override
  int indexWhere(bool Function(JsonEntry element) test, [int start = 0]) =>
      this.indexWhere(test, start);

  @override
  void insert(int index, JsonEntry element) =>
      this._elements.insert(index, element);

  @override
  void insertAll(int index, Iterable<JsonEntry> iterable) =>
      this._elements.insertAll(index, iterable);

  @override
  void set last(JsonEntry value) => this._elements.last = value;

  @override
  int lastIndexOf(JsonEntry element, [int start]) =>
      this._elements.lastIndexOf(element, start);

  @override
  int lastIndexWhere(bool Function(JsonEntry element) test, [int start]) =>
      this._elements.lastIndexWhere(test, start);

  @override
  void set length(int newLength) => this._elements.length = newLength;

  @override
  bool remove(Object value) => this.remove(value);

  @override
  JsonEntry removeAt(int index) => this.removeAt(index);

  @override
  JsonEntry removeLast() => this._elements.removeLast();

  @override
  void removeRange(int start, int end) =>
      this._elements.removeRange(start, end);

  @override
  void removeWhere(bool Function(JsonEntry element) test) =>
      this._elements.removeWhere(test);

  @override
  void replaceRange(int start, int end, Iterable<JsonEntry> replacement) =>
      this._elements.replaceRange(start, end, replacement);

  @override
  void retainWhere(bool Function(JsonEntry element) test) =>
      this._elements.retainWhere(test);

  Iterable<JsonEntry> get reversed => this._elements.reversed;

  @override
  void setAll(int index, Iterable<JsonEntry> iterable) =>
      this.setAll(index, iterable);

  @override
  void setRange(int start, int end, Iterable<JsonEntry> iterable,
          [int skipCount = 0]) =>
      this._elements.setRange(start, end, iterable);

  @override
  void shuffle([Random random]) => this._elements.shuffle(random);

  @override
  void sort([int Function(JsonEntry a, JsonEntry b) compare]) =>
      this._elements.sort(compare);

  @override
  List<JsonEntry> sublist(int start, [int end]) =>
      this._elements.sublist(start, end);
}
