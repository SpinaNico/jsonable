import "package:jsonable/jsonable_reflect.dart";

mixin mixinValidator {
  JsonValidator _jsonValidators;
  setValidator(JsonValidator jv) {
    this._jsonValidators = jv;
  }

  List<JsonableException> validate(String name, dynamic value) {
    if (this._jsonValidators == null)
      return [];
    else {
      List<JsonableException> result = [];

      /// validation required
      if (this._jsonValidators.required == true) {
        if (value == null)
          result.add(
              JsonableException(message: """Error $name is required field."""));
      }

      /// Validation length
      if (this._jsonValidators.lenght != null) {
        var n = lengthElement(value);
        if (this._jsonValidators.lenght != n)
          result.add(JsonableException(
              message:
                  "Error $name not have ${this._jsonValidators.lenght} length"));
      }

      /// validation max
      if (this._jsonValidators.max != null) {
        var n = lengthElement(value);
        if (this._jsonValidators.max < n)
          result.add(JsonableException(
              message:
                  "Error $name field exceeds the maximumn ${this._jsonValidators.max}"));
      }

      /// validation min
      if (this._jsonValidators.min != null) {
        var n = lengthElement(value);
        if (this._jsonValidators.min > n)
          result.add(JsonableException(
              message:
                  "Error $name field does not reach the minimum  ${this._jsonValidators.min}"));
      }
      return result;
    }
  }
}

int lengthElement(dynamic value) {
  switch (value.runtimeType) {
    case String:
      return value.toString().length;
    case int:
      return value.toString().length;
    case List:
      return value.length;
    case Map:
      return value.length;
    case bool:
      throw "You can't use length on a bool";
    case double:
      return value.toString().length;
    default:
      throw "Hi, I know that I have not checked this data, open a issues on github https://github.com/SpinaNico/jsonable";
  }
}
