import 'package:offline_first/src/model/note.dart';
import 'package:offline_first/src/service/local/base/base_manage_database.dart';

/// Manage Table Database for each version of Database.
class ManageDatabase extends BaseManageDatabase {
  const ManageDatabase();

  /// Get queries string of create tables.
  ///
  /// [version] is version of database. version should be non-null.
  ///
  /// Return List<String> of queries.
  @override
  List<String> getTables() {
    return [
      Note.tableString,
    ];
  }
}
