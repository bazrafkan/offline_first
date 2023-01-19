import 'package:flutter/material.dart';
import 'package:offline_first/src/model/note.dart';
import 'package:offline_first/src/ui/home/base/base_view_model.dart';
import 'package:offline_first/src/ui/home/di/di_view_model_serivice_locator.dart';
import 'package:offline_first/src/ui/home/repository.dart';
import 'package:offline_first/src/ui/home/ui_state.dart';

class HomeViewModel extends ChangeNotifier with BaseHomeViewModel {
  late final HomeRepository _repository;
  final uiState = UiState();

  HomeViewModel.instance({HomeRepository? repository}) {
    const serviceLocator = HomeViewModelServiceLocator();
    _repository = repository ?? serviceLocator.getHomeRepository();
    uiState.notes = _repository.listNoteStream;
  }

  @override
  Future<void> getListNote() async {
    await _repository.getListNote();
  }

  @override
  void addNote(Note note) {
    _repository.addNote(note);
  }

  @override
  void dispose() {
    _repository.close();
    super.dispose();
  }
}
