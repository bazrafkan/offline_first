import 'dart:async';

import 'package:offline_first/src/model/note.dart';
import 'package:offline_first/src/service/base/base_note_service.dart';
import 'package:offline_first/src/service/local/database/app_database.dart';
import 'package:offline_first/src/service/local/di/di_note_serive.dart';

class NoteLocalService extends BaseNoteSerivce {
  late final AppDatabase _appDatabase;

  NoteLocalService({AppDatabase? appDatabase}) {
    const serviceLocator = NoteServiceServiceLocator();
    _appDatabase = appDatabase ?? serviceLocator.getAppDatabase();
  }

  @override
  Future<void> addNote(Note note) async {
    await _appDatabase.insertData(
      tableName: Note.tableName,
      item: note.toJson(),
    );
  }

  @override
  Future<void> deleteNoteFromId(int id) async {
    await _appDatabase.deleteData(
      tableName: Note.tableName,
      where: Note.whereId,
      whereArgs: [id],
    );
  }

  @override
  Future<List<Note>?> getListNote() async {
    final result = await _appDatabase.getData(
      tableName: Note.tableName,
    );
    return result.map((json) => Note.fromJson(json)).toList();
  }

  @override
  Future<Note?> getNotefromId(int id) async {
    final map = await _appDatabase.getData(
      tableName: Note.tableName,
      where: Note.whereId,
      whereArgs: [id],
    );
    var result = map.map<Note>(
      (json) => Note.fromJson(json),
    );
    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  @override
  Future<void> updateNote(Note note) async {
    await _appDatabase.updateData(
      tableName: Note.tableName,
      item: note.toJson(),
      where: Note.whereId,
      whereArgs: [note.id],
    );
  }
}
