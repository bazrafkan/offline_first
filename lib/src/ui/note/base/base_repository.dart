import 'dart:async';

import 'package:offline_first/src/model/note.dart';

abstract class BaseNoteRepository {
  StreamSink<Note> get inSaveNote;
  StreamSink<int> get inDeleteNote;
  StreamSink<bool> get inDeleted;
  Stream<bool> get deleted;

  void initializationStream();
  void saveNote(Note note);
  void deleteNoteFromId(int id);
  void close();
}
