import 'dart:async';

import 'package:offline_first/src/model/note.dart';
import 'package:offline_first/src/service/local/note_local_service.dart';
import 'package:offline_first/src/service/remote/note_remote_service.dart';
import 'package:offline_first/src/ui/note/base/base_repository.dart';
import 'package:offline_first/src/ui/note/di/di_repository_service_locator.dart';

class NoteRepository extends BaseNoteRepository {
  late final NoteLocalService _localService;
  late final NoteRemoteService _remoteService;

  final _saveNoteController = StreamController<Note>.broadcast();
  final _deleteNoteController = StreamController<int>.broadcast();
  final _noteDeletedController = StreamController<bool>.broadcast();

  @override
  StreamSink<Note> get inSaveNote => _saveNoteController.sink;
  @override
  StreamSink<int> get inDeleteNote => _deleteNoteController.sink;
  @override
  Stream<bool> get deleted => _noteDeletedController.stream;
  @override
  StreamSink<bool> get inDeleted => _noteDeletedController.sink;

  NoteRepository({
    NoteLocalService? localService,
    NoteRemoteService? remoteService,
  }) {
    const serviceLocator = NoteRepositoryServiceLocator();
    _localService = localService ?? serviceLocator.getNoteLocalService();
    _remoteService = remoteService ?? serviceLocator.getNoteRemoteService();

    initializationStream();
  }

  @override
  void initializationStream() {
    _saveNoteController.stream.listen((Note note) async {
      await _localService.updateNote(note);
      await _remoteService.updateNote(note);
    });
    _deleteNoteController.stream.listen((int id) async {
      await _localService.deleteNoteFromId(id);
      await _remoteService.deleteNoteFromId(id);
      inDeleted.add(true);
    });
  }

  @override
  void saveNote(Note note) {
    inSaveNote.add(note);
  }

  @override
  void deleteNoteFromId(int id) {
    inDeleteNote.add(id);
  }

  @override
  void close() {
    _saveNoteController.close();
    _deleteNoteController.close();
    _noteDeletedController.close();
  }
}
