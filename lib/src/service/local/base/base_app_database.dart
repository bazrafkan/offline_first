abstract class BaseAppDatabase {
  Future<int> insertData({
    required String tableName,
    required Map<String, dynamic> item,
  });

  Future<void> insertAll({
    required String tableName,
    required List<Map<String, dynamic>> items,
  });

  Future<List<Map>> getData({
    required String tableName,
    String? where,
    String? orderBy,
    int? limit,
    List? whereArgs,
    int? offset,
  });

  Future<int> updateData({
    required String tableName,
    required Map<String, dynamic> item,
    String? where,
    List? whereArgs,
  });

  Future<int> deleteData({
    required String tableName,
    String? where,
    List<Object?>? whereArgs,
  });

  Future<List<Map>> rawQuery(String query);

  Future<void> deleteDataWithBatch({
    required List<String> listTable,
    required List<String> listWhere,
    required List<List<String>> listWhereArgs,
  });
}
