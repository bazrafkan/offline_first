import 'package:offline_first/src/ui/note/repository.dart';

abstract class BaseNoteViewModelServiceLocator {
  const BaseNoteViewModelServiceLocator();

  NoteRepository getNoteRepository();
}
