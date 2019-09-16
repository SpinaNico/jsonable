import "./withReflect/jsonable.dart";
import "./withReflect/mapable.dart";
export "./withReflect/jsonable.dart" show jsonable;
export "./withReflect/mapable.dart" show mapable;
export './withReflect/annotation.dart' show JsonNote, JsonValidator;
export "./withReflect/validator/exceptions.dart";
export "./withReflect/validator/jsonValidator.dart" show validate;

///This class is used to implement the toJson fromJson methods within any object
abstract class Jsonable with mixinJson {}

///This class is used to implement the toMap fromMap methods within any object
abstract class Mapable with mixinMap {}

///This class is used to implement the toMap, fromMap, toJson, fromJson methods within any object
abstract class JsonableMapable with mixinJson, mixinMap {}
