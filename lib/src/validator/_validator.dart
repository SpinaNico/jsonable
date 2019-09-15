import "package:jsonable/jsonable.dart";

mixin mixinValidator {
  JsonValidator _jsonValidators;
  setValidator(JsonValidator jv) {
    this._jsonValidators = jv;
  }

  Map<String, JsonableException> validate(String name, dynamic value) {
    if (this._jsonValidators == null)
      return {};
    else {
      Map<String, JsonableException> result = {};
      if (this._jsonValidators.required == true) {
        if (value == null)
          result.addAll({
            name:
                JsonableException(message: """Error $name is required field """)
          });
      }
      if (this._jsonValidators.max != null) {}
      return result;
    }
  }
}
