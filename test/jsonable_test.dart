import "package:test/test.dart";
import "package:jsonable/jsonable.dart";

class MyTestClass extends Jsonable {
  String name = "ugo";
  String surname = "rossi";
}

class myTestClassWithList extends Jsonable {
  List<String> l = ["hello", "world"];
}

main() {
  group("jsonable test", () {
    var c = MyTestClass();
    var withList = myTestClassWithList();
    test("toJson it work?", () {
      expect(c.toJson(), """{"name":"ugo","surname":"rossi"}""");
    });

    test("json with list", () {
      expect(withList.toJson(), """{"l":["hello","world"]}""");
    });
  });
}
