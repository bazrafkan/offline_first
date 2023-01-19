import 'package:offline_first/src/model/note.dart';

abstract class BaseHomeViewModel {
  void addNote(Note note);
  Future<void> getListNote();
  void dispose();
}
