import 'package:sqflite/sqflite.dart';

/// BEGIN ADDTASKS
Future performAddTasks(
  Database database, {
  String? task,
  String? details,
  int? endDate,
}) {
  final query = '''
INSERT INTO Tasks (Task, Details, EndDate, TaskStatus) VALUES ('${task}', '${details}', ${endDate}, 0);
''';
  return database.rawQuery(query);
}

/// END ADDTASKS

/// BEGIN UPDATETASKS
Future performUpdateTasks(
  Database database, {
  String? title,
  String? details,
  int? endDate,
  int? taskStatus,
  int? id,
}) {
  final query = '''
UPDATE Tasks
SET 
    Title = '${title}',
    Details = '${details}',
    EndDate = ${endDate},
   TaskStatus = ${taskStatus}
WHERE ID = ${id};
''';
  return database.rawQuery(query);
}

/// END UPDATETASKS

/// BEGIN DELETEALLITEMS
Future performDeleteAllItems(
  Database database,
) {
  final query = '''
DELETE FROM Items;
''';
  return database.rawQuery(query);
}

/// END DELETEALLITEMS

/// BEGIN UPDATEITEMS
Future performUpdateItems(
  Database database, {
  String? name,
  String? type,
  int? stock,
  String? menuvalue,
  int? id,
}) {
  final query = '''
UPDATE Items
SET 
    Itemname = '${name}',
    Itemtype = '${type}',
    stock = ${stock},
    menuvalue = ${menuvalue}
WHERE ID = ${id};
''';
  return database.rawQuery(query);
}

/// END UPDATEITEMS

/// BEGIN UPITEMSSYNC
Future performUpItemsSync(
  Database database,
) {
  final query = '''
UPDATE Items
SET LastSync = CURRENT_TIMESTAMP
WHERE LastUpdate > COALESCE(LastSync,'1970-01-01T00:00:00.000Z');
''';
  return database.rawQuery(query);
}

/// END UPITEMSSYNC

/// BEGIN ADDITEM
Future performAddItem(
  Database database, {
  int? id,
  String? itemname,
}) {
  final query = '''
INSERT INTO Items (ID, Itemname) VALUES ('${id}', '${itemname}');
''';
  return database.rawQuery(query);
}

/// END ADDITEM
