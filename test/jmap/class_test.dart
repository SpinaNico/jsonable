import 'package:jsonable/jsonable.dart';
import 'package:test/test.dart';

class PearsonWithJsonable with Jsonable {
  late JMap<String?, PearsonWithJsonable?> example;
  late JNum code;
  PearsonWithJsonable() {
    code = jNum("code");
    example = jMap("example", builder: () => PearsonWithJsonable());
  }
}

main() {
  var source = """
  {
    "code": 0,
    "example":{
      "p1": {"code": 1},
      "p2": {"code": 2}
    }
  }

  """;

  group("json recorsive test", () {
    test("recorsive this", () {
      var p = PearsonWithJsonable()..fromJson(source);
      expect(p.code.getNum(), 0);
      expect(p.example["p1"]!.code.getNum(), 1);
      expect(p.example["p2"]!.code.getNum(), 2);
    });
  });
}
