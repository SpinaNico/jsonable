import 'package:jsonable/jsonable.dart';
import 'package:test/test.dart';

class PearsonWithJsonable with Jsonable {
  late JList<PearsonWithJsonable?> example;
  late JNum code;
  PearsonWithJsonable() {
    code = jNum("code");
    example = jList("example", builder: () => PearsonWithJsonable());
  }
}

main() {
  var source = """
  {
    "code": 0,
    "example":[{"code": 1}, {"code": 2}]
  }

  """;

  group("json recorsive test", () {
    test("recorsive this", () {
      var p = PearsonWithJsonable()..fromJson(source);
      expect(p.code.getNum(), 0);
      expect(p.example[0]!.code.getNum(), 1);
      expect(p.example[1]!.code.getNum(), 2);
    });
  });
}
