import 'package:offline_first/src/service/local/database/app_database.dart';

abstract class BaseNoteServiceServiceLocator {
  AppDatabase getAppDatabase();
}
