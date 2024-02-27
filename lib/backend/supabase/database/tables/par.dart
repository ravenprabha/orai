import '../database.dart';

class ParTable extends SupabaseTable<ParRow> {
  @override
  String get tableName => 'par';

  @override
  ParRow createRow(Map<String, dynamic> data) => ParRow(data);
}

class ParRow extends SupabaseDataRow {
  ParRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ParTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get sitename => getField<String>('sitename');
  set sitename(String? value) => setField<String>('sitename', value);

  String? get custname => getField<String>('custname');
  set custname(String? value) => setField<String>('custname', value);

  String? get plan => getField<String>('plan');
  set plan(String? value) => setField<String>('plan', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
