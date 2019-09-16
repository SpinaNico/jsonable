/// This annotation is used to validate the Json / map check if the fields have those specified rules.
class JsonValidator {
  final int max;
  final int min;
  final bool required;
  final int lenght;
  const JsonValidator({this.max, this.min, this.required, this.lenght});
}
