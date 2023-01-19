import 'package:offline_first/src/service/local/note_local_service.dart';
import 'package:offline_first/src/service/remote/note_remote_service.dart';
import 'package:offline_first/src/ui/home/base/base_di_repository_service_locator.dart';

class HomeRepositoryServiceLocator extends BaseHomeRepositoryServiceLocator {
  const HomeRepositoryServiceLocator();

  @override
  NoteLocalService getNoteLocalService() {
    return NoteLocalService();
  }

  @override
  NoteRemoteService getNoteRemoteService() {
    return NoteRemoteService();
  }
}
