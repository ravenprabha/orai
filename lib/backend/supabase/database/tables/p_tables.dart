import '../database.dart';

class PTablesTable extends SupabaseTable<PTablesRow> {
  @override
  String get tableName => 'p.tables';

  @override
  PTablesRow createRow(Map<String, dynamic> data) => PTablesRow(data);
}

class PTablesRow extends SupabaseDataRow {
  PTablesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PTablesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get capacity => getField<int>('capacity');
  set capacity(int? value) => setField<int>('capacity', value);

  int? get storeid => getField<int>('storeid');
  set storeid(int? value) => setField<int>('storeid', value);
}
