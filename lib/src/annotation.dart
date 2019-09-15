///This annotation is very useful to change the name of a field or skip it because it should not be parsed
class JsonNote {
  final String keyName;

  final bool exclude;

  const JsonNote({this.keyName: null, this.exclude: false});
}

/// This annotation is used to validate the Json / map check if the fields have those specified rules.
class JsonValidator {
  final int max;
  final int min;
  final bool required;
  final bool omitempty;

  final int lenght;

  const JsonValidator(
      {this.max, this.min, this.required, this.omitempty, this.lenght});
}
