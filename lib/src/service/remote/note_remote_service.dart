import 'package:offline_first/src/model/note.dart';
import 'package:offline_first/src/service/base/base_note_service.dart';

class NoteRemoteService implements BaseNoteSerivce {
  @override
  Future<void> addNote(Note note) async {
    // TODO: implement addNote
    // throw UnimplementedError();
    return;
  }

  @override
  Future<void> deleteNoteFromId(int id) async {
    // TODO: implement deleteNoteFromId
    // throw UnimplementedError();
  }

  @override
  Future<List<Note>?> getListNote() async {
    // TODO: implement getListNote
    return null;
  }

  @override
  Future<Note?> getNotefromId(int id) async {
    // TODO: implement getNotefromId
    // throw UnimplementedError();
    return null;
  }

  @override
  Future<void> updateNote(Note note) async {
    // TODO: implement updateNote
    // throw UnimplementedError();
  }
}
