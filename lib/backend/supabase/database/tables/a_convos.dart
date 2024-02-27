import '../database.dart';

class AConvosTable extends SupabaseTable<AConvosRow> {
  @override
  String get tableName => 'a.convos';

  @override
  AConvosRow createRow(Map<String, dynamic> data) => AConvosRow(data);
}

class AConvosRow extends SupabaseDataRow {
  AConvosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AConvosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get convo => getField<String>('convo');
  set convo(String? value) => setField<String>('convo', value);

  int? get a2 => getField<int>('a2');
  set a2(int? value) => setField<int>('a2', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  List<String> get convoas => getListField<String>('convoas');
  set convoas(List<String>? value) => setListField<String>('convoas', value);

  int? get a1 => getField<int>('a1');
  set a1(int? value) => setField<int>('a1', value);
}
