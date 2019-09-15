import "package:jsonable/jsonable.dart";

mixin mixinValidator {
  JsonValidator _jsonValidators;
  setValidator(JsonValidator jv) {
    this._jsonValidators = jv;
  }

  Map<String, Error> validate() {
    // TODO: implement validate
    return null;
  }
}
