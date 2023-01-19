import 'dart:async';

import 'package:offline_first/src/model/note.dart';

abstract class BaseHomeRepository {
  Stream<List<Note>> get listNoteStream;
  StreamSink<Note> get inAddNote;
  StreamSink<List<Note>> get inNotes;

  void initializationNotesStream();
  Future<void> getListNote();
  void addNote(Note note);
  void close();
}
