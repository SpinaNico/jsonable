import "./simple_class.dart";
import 'package:benchmark_harness/benchmark_harness.dart';

const int N = 10000;
const Map<String, dynamic> source = {"name": "Nico", "surname": "Spina"};

/// code generated by https://javiercbk.github.io/json_to_dart/
class PersonNormal {
  String name;
  String surname;

  PersonNormal({this.name, this.surname});

  /// I modified the generated code here.
  fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    return data;
  }
}

class JsonableClassTest extends BenchmarkBase {
  const JsonableClassTest() : super("Jsoanble class struct");

  static void main() {
    new JsonableClassTest().report();
  }

  void run() {
    for (var i = 0; i < N; i++) {
      var p = Person();
      p.fromMap(source);
      p.toMap();
    }
  }

  void setup() {}
  void teardown() {}
}

class JsonableFromMap extends BenchmarkBase {
  const JsonableFromMap() : super("Jsoanble (fromMap)");

  static void main() {
    new JsonableFromMap().report();
  }

  void run() {
    for (var i = 0; i < N; i++) {
      var p = Person();
      p.fromMap(source);
    }
  }

  void setup() {}
  void teardown() {}
}

class JsonableToMap extends BenchmarkBase {
  const JsonableToMap() : super("Jsoanble (toMap)");

  static void main() {
    new JsonableToMap().report();
  }

  void run() {
    for (var i = 0; i < N; i++) {
      var p = Person();
      p.toMap();
    }
  }

  void setup() {}
  void teardown() {}
}

// -------

class NormalJsonParse extends BenchmarkBase {
  const NormalJsonParse() : super("Normal class struct  ");

  static void main() {
    new NormalJsonParse().report();
  }

  void run() {
    for (var i = 0; i < N; i++) {
      var p = PersonNormal();
      p.fromJson(source);
      p.toJson();
    }
  }

  void setup() {}
  void teardown() {}
}

class NormalFromJson extends BenchmarkBase {
  const NormalFromJson() : super("Normal  (fromJson) ");

  static void main() {
    new NormalFromJson().report();
  }

  void run() {
    for (var i = 0; i < N; i++) {
      var p = PersonNormal();
      p.toJson();
    }
  }

  void setup() {}
  void teardown() {}
}

class NormalToJson extends BenchmarkBase {
  const NormalToJson() : super("Normal  (toJson) ");

  static void main() {
    new NormalToJson().report();
  }

  void run() {
    for (var i = 0; i < N; i++) {
      var p = PersonNormal();
      p.toJson();
    }
  }

  void setup() {}
  void teardown() {}
}

main() {
  JsonableClassTest.main();
  NormalJsonParse.main();
  print("-----");

  JsonableFromMap.main();
  JsonableToMap.main();

  NormalFromJson.main();
  NormalToJson.main();
}