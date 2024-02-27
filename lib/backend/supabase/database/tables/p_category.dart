import '../database.dart';

class PCategoryTable extends SupabaseTable<PCategoryRow> {
  @override
  String get tableName => 'p.category';

  @override
  PCategoryRow createRow(Map<String, dynamic> data) => PCategoryRow(data);
}

class PCategoryRow extends SupabaseDataRow {
  PCategoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PCategoryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get group => getField<String>('group');
  set group(String? value) => setField<String>('group', value);
}
