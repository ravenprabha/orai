import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN ALLTASKS
Future<List<AllTasksRow>> performAllTasks(
  Database database,
) {
  final query = '''
Select * from Tasks
''';
  return _readQuery(database, query, (d) => AllTasksRow(d));
}

class AllTasksRow extends SqliteRow {
  AllTasksRow(Map<String, dynamic> data) : super(data);

  int get id => data['ID'] as int;
  String get task => data['Task'] as String;
  String get details => data['Details'] as String;
  int get endDate => data['EndDate'] as int;
  int get taskStatus => data['TaskStatus'] as int;
}

/// END ALLTASKS

/// BEGIN GETALLITEMS
Future<List<GetAllItemsRow>> performGetAllItems(
  Database database,
) {
  final query = '''
Select * from Items
''';
  return _readQuery(database, query, (d) => GetAllItemsRow(d));
}

class GetAllItemsRow extends SqliteRow {
  GetAllItemsRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  DateTime get createdat => data['createdat'] as DateTime;
  DateTime get lastUpdate => data['LastUpdate'] as DateTime;
  String get lastSync => data['LastSync'] as String;
  String get itemname => data['Itemname'] as String;
}

/// END GETALLITEMS

/// BEGIN GETITEMCHANGES
Future<List<GetItemChangesRow>> performGetItemChanges(
  Database database,
) {
  final query = '''
SELECT * FROM Items
 WHERE LastUpdate > COALESCE(LastSync, '1970-01-01T00:00:00.000Z');
''';
  return _readQuery(database, query, (d) => GetItemChangesRow(d));
}

class GetItemChangesRow extends SqliteRow {
  GetItemChangesRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  int get stock => data['stock'] as int;
  String get itemname => data['Itemname'] as String;
}

/// END GETITEMCHANGES
