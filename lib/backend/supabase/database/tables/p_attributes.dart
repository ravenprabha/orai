import '../database.dart';

class PAttributesTable extends SupabaseTable<PAttributesRow> {
  @override
  String get tableName => 'p.attributes';

  @override
  PAttributesRow createRow(Map<String, dynamic> data) => PAttributesRow(data);
}

class PAttributesRow extends SupabaseDataRow {
  PAttributesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PAttributesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
