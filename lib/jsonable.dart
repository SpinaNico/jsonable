import "./src/jsonable.dart";
import "./src/mapable.dart";

///This class is used to implement the toJson fromJson methods within any object
abstract class Jsonable with mixinJson {}

///This class is used to implement the toMap fromMap methods within any object
abstract class Mapable with mapMixin {}

///This class is used to implement the toMap, fromMap, toJson, fromJson methods within any object
abstract class JsonableMapable with mixinJson, mapMixin {}
