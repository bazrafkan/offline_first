import 'package:offline_first/src/service/local/note_local_service.dart';
import 'package:offline_first/src/service/remote/note_remote_service.dart';

abstract class BaseHomeRepositoryServiceLocator {
  const BaseHomeRepositoryServiceLocator();
  NoteLocalService getNoteLocalService();

  NoteRemoteService getNoteRemoteService();
}
