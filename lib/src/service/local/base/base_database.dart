abstract class BaseDatabase {
  bool get isOpen;
  String get foreignKeysON;
  String get databaseName;

  Future<dynamic> initialize();

  Future<dynamic> get database;

  Future<void> onConfigure(dynamic db);

  Future<void> onCreate(dynamic db, int version);

  Future<void> onUpgrade(
    dynamic db,
    int oldVersion,
    int newVersion,
  );

  Future<void> onOpen(dynamic db);

  Future<void> close();
}
