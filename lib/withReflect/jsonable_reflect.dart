import "./jsonable.dart";
import "./mapable.dart";
export "./jsonable.dart" show jsonable;
export "./mapable.dart" show mapable;
export './annotation.dart' show JsonNote, JsonValidator;
export "./validator/exceptions.dart";
export "./validator/jsonValidator.dart" show validate;

///This class is used to implement the toJson fromJson methods within any object
abstract class JsonableReflect with mixinJson {}

///This class is used to implement the toMap fromMap methods within any object
abstract class MapableReflect with mixinMap {}

///This class is used to implement the toMap, fromMap, toJson, fromJson methods within any object
abstract class JsonableMapable with mixinJson, mixinMap {}
