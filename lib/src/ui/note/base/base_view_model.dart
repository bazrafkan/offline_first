import 'package:offline_first/src/model/note.dart';

abstract class BaseNoteViewModel {
  Stream<bool> get deleted;

  void saveNote(Note note);
  void deleteNote(int id);
  void dispose();
}
