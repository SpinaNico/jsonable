import 'dart:convert';

import "package:test/test.dart";

import "../example/lib/JMapExample.dart";

main() {
  var fakeJson = """
  {
    "map": {"1": "hello", "ciao":"hello", "bool": true}
  }
  """;
  group("JMap test", () {
    var p = MyClass();
    p.fromJson(fakeJson);
    var trued = jsonDecode(fakeJson);
    test("correct is Map", () {
      expect(p.myMap.value["1"], trued["map"]["1"]);
    });
  });
}
