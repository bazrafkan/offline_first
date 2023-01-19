import 'package:offline_first/src/model/note.dart';

class UiState {
  bool loading = false;

  late Stream<List<Note>> notes;
}
