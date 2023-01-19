import 'package:offline_first/src/model/note.dart';

abstract class BaseNoteSerivce {
  Future<List<Note>?> getListNote();

  Future<Note?> getNotefromId(int id);

  Future<void> addNote(Note note);

  Future<void> updateNote(Note note);

  Future<void> deleteNoteFromId(int id);
}
