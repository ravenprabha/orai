import '../database.dart';

class ATable extends SupabaseTable<ARow> {
  @override
  String get tableName => 'a';

  @override
  ARow createRow(Map<String, dynamic> data) => ARow(data);
}

class ARow extends SupabaseDataRow {
  ARow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ATable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get age => getField<DateTime>('age');
  set age(DateTime? value) => setField<DateTime>('age', value);

  String? get userid => getField<String>('userid');
  set userid(String? value) => setField<String>('userid', value);

  String? get prof => getField<String>('prof');
  set prof(String? value) => setField<String>('prof', value);

  String? get team => getField<String>('team');
  set team(String? value) => setField<String>('team', value);

  int? get phone => getField<int>('phone');
  set phone(int? value) => setField<int>('phone', value);
}
