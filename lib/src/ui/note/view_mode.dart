import 'package:flutter/material.dart';
import 'package:offline_first/src/model/note.dart';
import 'package:offline_first/src/ui/note/base/base_view_model.dart';
import 'package:offline_first/src/ui/note/di/di_view_model_serivice_locator.dart';
import 'package:offline_first/src/ui/note/repository.dart';
import 'package:offline_first/src/ui/note/ui_state.dart';

class NoteViewModel extends ChangeNotifier with BaseNoteViewModel {
  late final NoteRepository _repository;
  final uiState = UiState();

  NoteViewModel.instance({NoteRepository? repository}) {
    const serviceLocator = NoteViewModelServiceLocator();
    _repository = repository ?? serviceLocator.getNoteRepository();
  }

  @override
  Stream<bool> get deleted => _repository.deleted;

  @override
  void saveNote(Note note) {
    _repository.saveNote(note);
  }

  @override
  void deleteNote(int id) {
    _repository.deleteNoteFromId(id);
  }

  @override
  void dispose() {
    _repository.close();
    super.dispose();
  }
}
