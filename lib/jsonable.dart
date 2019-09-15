import "./src/jsonable.dart";
import "./src/mapable.dart";
export "./src/jsonable.dart" show jsonable;
export "./src/mapable.dart" show mapable;
export './src/annotation.dart' show JsonNote, JsonValidator;

///This class is used to implement the toJson fromJson methods within any object
abstract class Jsonable with mixinJson {}

///This class is used to implement the toMap fromMap methods within any object
abstract class Mapable with mixinMap {}

///This class is used to implement the toMap, fromMap, toJson, fromJson methods within any object
abstract class JsonableMapable with mixinJson, mixinMap {}
