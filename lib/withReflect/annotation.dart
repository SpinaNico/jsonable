export "./validator/annotation.dart";

///This annotation is very useful to change the name of a field or skip it because it should not be parsed
class JsonNote {
  final String keyName;

  final bool exclude;

  const JsonNote({this.keyName: null, this.exclude: false});
}
