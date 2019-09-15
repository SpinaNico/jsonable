import "package:jsonable/jsonable.dart";

enum NoteType {
  Required,
  Excluse,
}

mixin mixinJsonNote {
  JsonNote _jsonNotes;

  setJsonNote(JsonNote note) {
    this._jsonNotes = note;
  }

  String get keyNamse => this._jsonNotes.keyName;
  bool get exclude => this._jsonNotes.exclude;
}
