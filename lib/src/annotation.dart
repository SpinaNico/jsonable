// class Jsonote {
//   String keyName;
//   Jsonote._({this.keyName});
//   factory Jsonote.useThisMethod({String keyName}) =>
//       Jsonote._(keyName: keyName);
// }

// class Mapnote {
//   String keyName;
//   Mapnote._({this.keyName});
//   factory Mapnote.useThisMethod({String keyName}) =>
//       Mapnote._(keyName: keyName);
// }

class JsonableNote {
  final String keyName;
  final bool isMethod;
  final bool notNull;

  const JsonableNote({this.keyName, this.isMethod, this.notNull});
}
