import 'package:offline_first/src/ui/note/base/base_di_view_model_serivice_locator.dart';
import 'package:offline_first/src/ui/note/repository.dart';

class NoteViewModelServiceLocator extends BaseNoteViewModelServiceLocator {
  const NoteViewModelServiceLocator();

  @override
  NoteRepository getNoteRepository() {
    return NoteRepository();
  }
}
