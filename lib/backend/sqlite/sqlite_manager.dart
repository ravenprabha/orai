import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'tardb',
      'tar.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<AllTasksRow>> allTasks() => performAllTasks(
        _database,
      );

  Future<List<GetAllItemsRow>> getAllItems() => performGetAllItems(
        _database,
      );

  Future<List<GetItemChangesRow>> getItemChanges() => performGetItemChanges(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future addTasks({
    String? task,
    String? details,
    int? endDate,
  }) =>
      performAddTasks(
        _database,
        task: task,
        details: details,
        endDate: endDate,
      );

  Future updateTasks({
    String? title,
    String? details,
    int? endDate,
    int? taskStatus,
    int? id,
  }) =>
      performUpdateTasks(
        _database,
        title: title,
        details: details,
        endDate: endDate,
        taskStatus: taskStatus,
        id: id,
      );

  Future deleteAllItems() => performDeleteAllItems(
        _database,
      );

  Future updateItems({
    String? name,
    String? type,
    int? stock,
    String? menuvalue,
    int? id,
  }) =>
      performUpdateItems(
        _database,
        name: name,
        type: type,
        stock: stock,
        menuvalue: menuvalue,
        id: id,
      );

  Future upItemsSync() => performUpItemsSync(
        _database,
      );

  Future addItem({
    int? id,
    String? itemname,
  }) =>
      performAddItem(
        _database,
        id: id,
        itemname: itemname,
      );

  /// END UPDATE QUERY CALLS
}
