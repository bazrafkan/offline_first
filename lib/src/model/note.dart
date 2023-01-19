class Note {
  int? id;
  String contents;
  int savedInCloud;

  Note({
    this.id,
    required this.contents,
    this.savedInCloud = 0,
  });

  factory Note.fromJson(Map<dynamic, dynamic> json) => Note(
        id: json["id"],
        contents: json["contents"],
        savedInCloud: json["savedInCloud"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contents": contents,
        "savedInCloud": savedInCloud,
      };

  static String get tableName => 'note';

  static String get whereId => 'id = ?';

  static String get tableString => '''
    CREATE TABLE IF NOT EXISTS $tableName(
      id INTEGER PRIMARY KEY autoincrement,
      contents TEXT DEFAULT '',
      savedInCloud INTEGER NOT NULL
      );
    ''';
}
