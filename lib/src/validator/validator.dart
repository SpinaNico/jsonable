abstract class Validator {
  final int len;
  final num max;
  final num min;
  final List oneOf;
  final RegExp regex;
  final dynamic notEgual;
  final dynamic egual;
  final bool required;
  final List<String> requiredWidth;
  final List<String> requiredWithout;
  final String badCharacter;
  Validator({
    this.len,
    this.min,
    this.max,
    this.oneOf,
    this.regex,
    this.notEgual,
    this.egual,
    this.required,
    this.requiredWidth,
    this.requiredWithout,
    this.badCharacter,
  });
}

class CValidator extends Validator {
  CValidator({
    int len,
    num max,
    num min,
    List oneOf,
    RegExp regex,
    dynamic notEgual,
    dynamic egual,
    bool required,
    List<String> requiredWidth,
    List<String> requiredWithout,
    String badCharacter,
  }) : super(
          len: len,
          max: max,
          min: min,
          oneOf: oneOf,
          regex: regex,
          notEgual: notEgual,
          egual: egual,
          required: required,
          requiredWidth: requiredWidth,
          requiredWithout: requiredWithout,
          badCharacter: badCharacter,
        );
}
