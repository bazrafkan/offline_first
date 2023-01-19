import 'package:offline_first/src/service/local/base/base_di_note_serive.dart';
import 'package:offline_first/src/service/local/database/app_database.dart';

class NoteServiceServiceLocator implements BaseNoteServiceServiceLocator {
  const NoteServiceServiceLocator();

  @override
  AppDatabase getAppDatabase() {
    return AppDatabase.db;
  }
}
