import "package:jsonable/jsonable.dart";
import "../../example/lib/jmap/example_json.dart";

main() {
  var p = Person(id: 100, contact: {
    'pc': Contact(price: 500, title: 'a01'),
    'nb': Contact(price: 100, title: 'b01')
  });
  print(p.toJson());

  var s =
      """{"id":100,"contact":{"pc":{"price":500,"title":"a01"},"nb":{"price":100,"title":"b01"}}}""";

  p.fromJson(s);
  print(p.toJson());
}
