import 'dart:async';

import 'package:offline_first/src/model/note.dart';
import 'package:offline_first/src/service/local/note_local_service.dart';
import 'package:offline_first/src/service/remote/note_remote_service.dart';
import 'package:offline_first/src/ui/home/base/base_repository.dart';
import 'package:offline_first/src/ui/home/di/di_repository_service_locator.dart';

class HomeRepository extends BaseHomeRepository {
  late final NoteLocalService _localService;
  late final NoteRemoteService _remoteService;

  final _notesStreamController = StreamController<List<Note>>.broadcast();
  final _addNoteStreamController = StreamController<Note>.broadcast();

  @override
  Stream<List<Note>> get listNoteStream => _notesStreamController.stream;
  @override
  StreamSink<Note> get inAddNote => _addNoteStreamController.sink;
  @override
  StreamSink<List<Note>> get inNotes => _notesStreamController.sink;

  HomeRepository({
    NoteLocalService? localService,
    NoteRemoteService? remoteService,
  }) {
    const serviceLocator = HomeRepositoryServiceLocator();
    _localService = localService ?? serviceLocator.getNoteLocalService();
    _remoteService = remoteService ?? serviceLocator.getNoteRemoteService();

    initializationNotesStream();
  }

  @override
  void initializationNotesStream() {
    getListNote();
    _addNoteStreamController.stream.listen((Note note) async {
      await _localService.addNote(note);
      getListNote();
    });
  }

  @override
  Future<void> getListNote() async {
    _remoteService.getListNote().then((value) {
      //TODO: first check if is note same as local  list note, then update local note
    });
    final listNote = await _localService.getListNote();
    if (listNote != null) {
      inNotes.add(listNote);
    }
  }

  @override
  void addNote(Note note) {
    inAddNote.add(note);
  }

  @override
  void close() {
    _notesStreamController.close();
    _addNoteStreamController.close();
  }
}
