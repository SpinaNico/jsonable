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

  String get keyName => this._jsonNotes?.keyName;
  bool get exclude => this._jsonNotes == null ? false : this._jsonNotes.exclude;
}
